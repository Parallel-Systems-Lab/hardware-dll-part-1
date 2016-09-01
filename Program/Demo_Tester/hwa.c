/***************************************************************************
 *
 * 							High Speed Digital Systems Laboratory
 * 							Electrical Engineering Department
 * 							Technion ג€“ Israel Institute of Technology
 *
 * Student Project:	Hardware DLL (XilliX) 2014/2015
 *
 * Authors:				Alon Reznik		Anton Vainer
 * Supervisors:		Ina Rivkin			Oz Shmueli
 *
 * File Name:			hwa.c
 * Last Update:		23/02/2015
 *
 **************************************************************************/

#include <stdlib.h>		/* For dynamic memory management */
#include <stdio.h>		/* For FILE type and stream functions */
#include <dirent.h>     /* directory stuff */
#include "hwa.h"			/* For API definitions and declarations */
#include <fcntl.h>
#include <sys/mman.h>


/********** Macros, Data Structures and Type Definitions *********/

#define BUFFER_SIZE	256
#define RP_NUM		16
#define BASE_ADDR	0x43c00000	/* Base address of reconfigurable partition 0 */


#define MAP_SIZE 4096UL
#define MAP_MASK (MAP_SIZE - 1)

#define GPIO_DATA	    0x00
#define GPIO_CONTROLL   0x04


struct HWA {
   int index;
   int ins;
   int outs;
};


/************************** Auxiliary Functions *************************/

void Xil_Out16(long* OutAddress, short offset , long Value )
{
	printf("Xil_Out16: OutAddress: 0x%x offset: %u Value: %u\n" , OutAddress , offset , Value);
	OutAddress[offset] = Value;
}

void Xil_OutChar(char* OutAddress, short offset , long Value )
{
	//printf("Xil_Out16: OutAddress: 0x%x offset: %u Value: %u\n" , OutAddress , offset , Value);
	OutAddress[offset] = Value;
}

char Xil_InChar(char* Addr , short offset)
{
	//printf("Xil_In16: Addr: 0x%x offset: %u\n" , Addr , offset);
	return Addr[offset];
}
long Xil_In16(long* Addr , short offset)
{
	printf("Xil_In16: Addr: 0x%x offset: %u\n" , Addr , offset);
	return Addr[offset];
}

// acc_io, if param in input = 1 , if output = 0
void acc_start(unsigned int base_address , int num_params , unsigned int* params) {
	int memfd , i;
	void *mapped_base;
	unsigned int param_addr = 0x14;
	off_t dev_base = base_address;
	printf("opening the mem file\n\r");
	memfd = open("/dev/mem", O_RDWR | O_SYNC);
    if (memfd == -1) {
		printf("Can't open /dev/mem.\n");
		exit(0);
	}
    printf("mapping the memory\n\r");
	mapped_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, dev_base);
	if (mapped_base == (void *) -1) {
		printf("Can't map the memory to user space.\n");
		exit(0);
	}
	printf("sending params\n\r");
	for (i=0 ; i<num_params ; i++) {
			Xil_Out16(mapped_base, param_addr , params[i]);
			param_addr +=4;
	}
	printf("sending start pulse\n\r");
	Xil_OutChar(mapped_base, 0 , 1);
	Xil_OutChar(mapped_base, 0 , 0);
	close(memfd);
}

void wait_for_result(unsigned int base_address , int ins , int outs , unsigned int* params) {
	int memfd , i;
	void *mapped_base;
	unsigned int param_addr = 0x14;
	off_t dev_base = base_address;
	memfd = open("/dev/mem", O_RDWR | O_SYNC);
    if (memfd == -1) {
		printf("Can't open /dev/mem.\n");
		exit(0);
	}
	mapped_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, dev_base);
	if (mapped_base == (void *) -1) {
		printf("Can't map the memory to user space.\n");
		exit(0);
	}
	param_addr = 4*ins;
	for (i=0 ; i<outs ; i++) {
		while(1){
			if(Xil_In16(mapped_base , param_addr))
				break;
			else
				continue;
			}
		params[i] = Xil_In16(mapped_base , param_addr+4);
		param_addr +=8;
	}
	close(memfd);
}

// 0 still working, 1 done
int pole_result(unsigned int base_address , int ins , int outs) {
	int memfd , i;
	void *mapped_base;
	unsigned int param_addr = 0x14;
	off_t dev_base = base_address;
	memfd = open("/dev/mem", O_RDWR | O_SYNC);
    if (memfd == -1) {
		printf("Can't open /dev/mem.\n");
		exit(0);
	}
	mapped_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, dev_base);
	if (mapped_base == (void *) -1) {
		printf("Can't map the memory to user space.\n");
		exit(0);
	}
	param_addr = 4*ins;
	for (i=0 ; i<outs ; i++) {
		if(!Xil_In16(mapped_base , param_addr)) {
			close(memfd);
			return 0;
		} else {
			param_addr +=8;
		}
	}
	close(memfd);
	return 1;
}





void errorReport(const char* errorMessage) {
	fprintf(stderr,"%s\n", errorMessage ? errorMessage : "ERROR: An unknown error occurred.");
	exit(1);
}


void reconfigurablePartitionWriteToFile(struct HWA hwa , int active) {
	char errorMessage [BUFFER_SIZE];
	char fileName [BUFFER_SIZE];
	FILE* file = NULL;
	snprintf(fileName, BUFFER_SIZE, "hwa_part_%d_", hwa.index);
	file = fopen(fileName, "w");
	if (!file) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to open file \"%s\".", fileName);
		errorReport(errorMessage);
	}		
	if (fprintf(file, "%u;", active) <= 0) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to write reconfigurable partition #%u module status.", hwa.index);
		errorReport(errorMessage);
	}
	if (fprintf(file, "%u;", hwa.ins) <= 0) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to write reconfigurable partition #%u module status.", hwa.index);
		errorReport(errorMessage);
	}
	if (fprintf(file, "%u;", hwa.outs) <= 0) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to write reconfigurable partition #%u module status.", hwa.index);
		errorReport(errorMessage);
	}
	return;
}

void xillixInitiateOrTerminate(const bool initiate) {
	char errorMessage [BUFFER_SIZE];
	char fileName [BUFFER_SIZE];
	FILE* file = NULL;
	struct HWA hwa;
	int i = 0;
	for (i=0; i<RP_NUM; i++) {
		snprintf(fileName, BUFFER_SIZE, "hwa_part_%d_", i);
		file = fopen(fileName, "w");
		if (!file) {
			snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to open file \"%s\".", fileName);
			errorReport(errorMessage);
		}
		if (initiate) {
			hwa.index = i;
			hwa.ins = 0;
			hwa.outs = 0;
			reconfigurablePartitionWriteToFile(hwa , 0);
			
		}
		else {
			if (remove(fileName)) {
				snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to remove file \"%s\".", fileName);
				errorReport(errorMessage);
			}
		}
		if (fclose(file)) {
			snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to close file \"%s\".", fileName);
			errorReport(errorMessage);
		}
	}
	return;
}



/******************* API Function Implementations *******************/

void xillixInitiate() {
	return xillixInitiateOrTerminate(true);
}

void xillixTerminate() {
	return xillixInitiateOrTerminate(false);
}


int reconfigurableModuleInsert(const char* path, const unsigned int inputParamNum, const unsigned int outputParamNum) {
	char errorMessage [BUFFER_SIZE];
	unsigned int bin_bitmask = 0;
	char fileName [BUFFER_SIZE];
	char command [BUFFER_SIZE];
	FILE* file = NULL;
	int offset = 0;
	int i;
	struct HWA hwa;
	DIR *dp;
	int final_index = -1;
	struct dirent *ep;
	dp = opendir (path);
	// build the bitmask
	printf("opening directory\n\r");
	if (dp != NULL)	{
		while (ep = readdir (dp)) {
			if (ep->d_name[0] == '.') continue;
			printf("testing first name: %s\n\r" ,ep->d_name );
			offset = ep->d_name[9]-'0';
			if (ep->d_name[10] != '.') {
				printf("number is doube digits\n\r");
				offset = (offset*10) + (ep->d_name[10] -'0');
			}
			bin_bitmask = bin_bitmask | (1<<offset);
			printf("number is: %c%c\n\r" , ep->d_name[9] , ep->d_name[10]);
			printf("calculated offset is %d\n\r" , offset);
			printf("new bitmask is: 0x%x\n\r" , bin_bitmask);
		}
		(void) closedir (dp);
    } else {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to open path \"%s\".", path);
		errorReport(errorMessage);
	}
	
	printf("built availible bin files, they are 0x%x\n\r" , bin_bitmask);
	for ( i=0; i<RP_NUM; i++) {
		snprintf(fileName, BUFFER_SIZE, "%shwa_part_%d.bin",path,  i);
		file = fopen(fileName, "w");
		if (!file) {
			snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to open file \"%s\".", fileName);
			errorReport(errorMessage);
		}
		if ( (!is_hw_taken(i)) && (bin_bitmask & (1<<i) != 0) ) {
			hwa.index = i;
			hwa.ins = inputParamNum;
			hwa.outs = outputParamNum;
			reconfigurablePartitionWriteToFile(hwa , 1);
			final_index = i;
			if (fclose(file)) {
				snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to close file \"%s\".", fileName);
				errorReport(errorMessage);
			}
			break;
		}
		if (fclose(file)) {
			snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to close file \"%s\".", fileName);
			errorReport(errorMessage);
		}
	}
	system("echo 1 > /sys/devices/amba.0/f8007000.ps7-dev-cfg/is_partial_bitstream");
	snprintf(command, BUFFER_SIZE, "cat %s > /dev/xdevcfg" , fileName);
	system(command);
	//load_bin_file(fileName);
	//system(const char *command);
	// Write partial bitfile to devcfg device
	//fd_devcfg = open("/dev/xdevcfg", O_RDWR);
	//if (fd_devcfg < 0) {
	//	perror("/dev/xdevcfg");
	//} else {
	//	write(fd_devcfg, buf_filter_bin, PR_BIN_SIZE); // write dynamic hardware filter
	//	close(fd_devcfg);
	//}
		
		
		
	return final_index;
}

int is_hw_taken(int index) {
	char errorMessage [BUFFER_SIZE];
	char fileName [BUFFER_SIZE];
	FILE* file = NULL;
	snprintf(fileName, BUFFER_SIZE, "hwa_part_%d_", index);
	file = fopen(fileName, "r");
	if (!file) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to open file \"%s\".", fileName);
		errorReport(errorMessage);
	}
	return fgetc(file) - '0';
}

struct HWA get_hwa(int index) {
	char errorMessage [BUFFER_SIZE];
	char fileName [BUFFER_SIZE];
	FILE* file = NULL;
	char temp = 'a';
	struct HWA hwa;
	hwa.index = index;
	hwa.ins = 0;
	hwa.outs = 0;
	snprintf(fileName, BUFFER_SIZE, "hwa_part_%d_", index);
	file = fopen(fileName, "r");
	if (!file) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: Failed to open file \"%s\".", fileName);
		errorReport(errorMessage);
	}
	temp = fgetc(file);
	temp = fgetc(file);
	while((temp = fgetc(file)) != ';') {
		hwa.ins = (hwa.ins*10) + (temp - '0');
	}
	while((temp = fgetc(file)) != ';') {
		hwa.outs = (hwa.outs*10) + (temp - '0');
	}
	return hwa;
}

void reconfigurableModuleEject(int index) {
	struct HWA hwa;
	hwa = get_hwa(index);
	if (!pole_result(BASE_ADDR+(index*0x10000) , hwa.ins , hwa.outs)) {
		printf("WORNING: ejecting an active module\n\r");
	}
	reconfigurablePartitionWriteToFile(hwa , 0);

}



void reconfigurableModuleActivate(int index, unsigned int* reconfigurableModuleParams) {
	char errorMessage [BUFFER_SIZE];
	struct HWA hwa;
	printf("cheking if module taken!\n\r");
	if (!is_hw_taken(index)) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: activating module that is not in use");
		errorReport(errorMessage);
	}
	printf("getting hwa struct\n\r");
	hwa = get_hwa(index);
	printf("starting module!\n\r");
	acc_start(BASE_ADDR+(index*0x10000) , hwa.ins , reconfigurableModuleParams);
	return;
}

int reconfigurableModuleTestIfDone(int index){
	char errorMessage [BUFFER_SIZE];
	struct HWA hwa = get_hwa(index);
	if (!is_hw_taken(index)) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: polling module that is not in use");
		errorReport(errorMessage);
	}
	if (!pole_result(BASE_ADDR+(index*0x10000) , hwa.ins , hwa.outs)) {
		return 0;
	}
	return 1;
}

unsigned int* reconfigurableModuleGetResult(int index ) {
	char errorMessage [BUFFER_SIZE];
	unsigned int* results;
	struct HWA hwa = get_hwa(index);
	if (!is_hw_taken(index)) {
		snprintf(errorMessage, BUFFER_SIZE, "ERROR: getting results from module that is not in use");
		errorReport(errorMessage);
	}
	results = malloc(sizeof(unsigned int)*hwa.outs);
	wait_for_result(BASE_ADDR+(index*0x10000) , hwa.ins , hwa.outs ,  results);

	return results;
}




















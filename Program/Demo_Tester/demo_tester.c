#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwa.h"




int main(int argc, char **argv)
{
	int size=0;
	int inputs[argc];
	int outputs[argc];
	int selection = 0;
	int status[16];
    int i=0;
	int temp_data=0;
	unsigned int* ins;
	unsigned int* outs;
	for (i=0 ; i<16; i++) status[i] = 0;

	if (argc == 1) {
		printf("provide paths to accelerators as arguments\n\r");
		return 1;
	}
	printf("the paths entered:\n\r");
	for (i=1 ; i<argc ; i++) {
		printf("provide input count for: \n\r%s\n\r" , argv[i]);
		scanf("%d" , &inputs[i]);
		printf("provide output count for: \n\r%s\n\r" , argv[i]);
		scanf("%d" , &outputs[i]);
	}
	printf("Welcome to the configuration system\n\r");
	while (1) {
		printf("press 0 to exit\n\r");
		printf("press 1 to load a new HWA\n\r");
		printf("press 2 to unload an HWA\n\r");
		printf("press 3 to use an HWA\n\r");
		scanf("%d" , &selection);
		if (selection == 0) break;
		if (selection == 1) {
			printf("enter the number of the accelerator to load:\n\r");
			for (i=1 ; i<argc ; i++) {
				printf("%d for %s\n\r" , i , argv[i]);
			}
			scanf("%d" , &selection);
			printf("inserting module from %s with %d inputs and %d outputs\n\r" , argv[selection], inputs[selection] , outputs[selection]);
			temp_data = reconfigurableModuleInsert(argv[selection], inputs[selection], outputs[selection]);
			if (temp_data == -1) {
				printf("error inserting module\n\r");
				exit(1);
			}
			printf("module inserted into partition %d\n\r" , temp_data);
			status[temp_data] = selection;
			continue;
		}
		if (selection == 2) {
			printf("enter the number of the accelerator to unload:\n\r");
			for(i=0 ; i<16 ; i++) {
				if (status[i] != 0) {
					printf("%d has %s\n\r" , i , argv[status[i]]);
				}
			}
			scanf("%d" , &selection);
			status[selection] = 0;
			reconfigurableModuleEject(selection);
			continue;
		}
		if (selection == 3) {
			printf("enter the number of the accelerator to use:\n\r");
			for(i=0 ; i<16 ; i++) {
				if (status[i] != 0) {
					printf("%d has %s\n\r" , i , argv[status[i]]);
				}
			}
			scanf("%d" , &selection);
			size = inputs[status[i]];
			// BUG BUG BUG BUG, returned size is 0
			printf("size is %d \n\r" , size);
			ins = malloc(sizeof(unsigned int)*size);
			printf("Enter inputs:\n\r");
			for(i=0 ; i<size ; i++) {
				printf("input %d:\n\r" , i);
				scanf("%d" , &ins[i]);
			}
			printf("activating the module with index %d and first param is %d\n\r" , selection , ins[0]);
			reconfigurableModuleActivate(selection , ins);
			printf("Working...\n\r");
			outs = reconfigurableModuleGetResult(selection);
			for(i=0 ; i<outputs[selection] ; i++) {
				printf("out %d is %d\n\r" , i , outs[i]);
			}
			continue;
		}
	}
	return 0;
}

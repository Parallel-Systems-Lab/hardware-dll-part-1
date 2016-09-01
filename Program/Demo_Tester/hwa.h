/***************************************************************************
 *
 * 							High Speed Digital Systems Laboratory
 * 							Electrical Engineering Department
 * 							Technion – Israel Institute of Technology
 *
 * Student Project:	Hardware DLL (XilliX) 2014/2015
 *
 * Authors:				Alon Reznik		Anton Vainer
 * Supervisors:		Ina Rivkin			Oz Shmueli
 *
 * File Name:			hwa.h
 * Last Update:		23/02/2015
 *
 **************************************************************************/

#ifndef HWA_H_
#define HWA_H_

#include <stdbool.h>	/* For bool type */


/**
 * xillixInitiate												- Initiate the XilliX FPGA management software.
 */
void xillixInitiate();

/**
 * xillixTerminate											- Terminate the XilliX FPGA management software.
 */
void xillixTerminate();

/**
 * reconfigurableModuleInsert						- Insert a reconfigurable module into a reconfigurable partition.
 *
 * @param path											- Path to a directory that contains the module's partial binary (bin) files.
 * @param inputParamNum						- Number of the reconfigurable module's input parameters.
 * @param outputParamNum						- Number of the reconfigurable module's output parameters.
 * @return								On failure		-1.
 * 											On success	an index of the partition used.
 *
 * Note:									Failure occurs when none of the reconfigurable partitions are available.
 * 											The reconfigurable module remains idle until reconfigurableModuleActivate is called.
 */
int reconfigurableModuleInsert(const char* path, const unsigned int inputParamNum, const unsigned int outputParamNum);

/**
 * reconfigurableModuleEject						- Eject a reconfigurable module from a reconfigurable partition.
 *
 * @param index				- index of the module to eject
 */
void reconfigurableModuleEject(int index);

/**
 * reconfigurableModuleActivate					- Activate a reconfigurable module inside a utilized reconfigurable partition.
 *
 * @param index							- the index of the module to activate
 * @param reconfigurableModuleParams	- A pointer to first parameter in the reconfigurable module's parameter array.
 *
 * Note:									The reconfigurable module's parameters must be 32-bit long.
 */
void reconfigurableModuleActivate(int index, unsigned int* reconfigurableModuleParams);

/**
 * reconfigurableModuleTestIfDone				- Test if the reconfigurable module finished its operation.
 *
 * @param index						- the index of the module to test
 * @return								On failure		- 0.
 * 											On success	- 1.
 *
 * Note:									Failure occurs as long as the reconfigurable module's output isn't ready.
 */
int reconfigurableModuleTestIfDone(int index);

/**
 * reconfigurableModuleGetResult				- Get the reconfigurable module's output parameters.
 *
 * @param index						-  the index of the module to get results from
 * @return								On failure		- NULL.
 * 											On success	- A pointer to first output parameter in the reconfigurable module's output parameter array.
 *
 * Note:									reconfigurableModuleGetResult waits for the reconfigurable module's output to become ready.
 * 											To avoid an infinite loop, failure occurs after a certain period of time.
 * 											The reconfigurable module's output parameters are 32-bit long.
 */
unsigned int* reconfigurableModuleGetResult(int index );




#endif	/* HWA_H_ */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwa.h"




int main(int argc, char **argv)
{
	int fd_is_partial;
    if (argc == 1) {
		printf("provide an argument:\n\r	1 for initiating the system \n\r	0 for shuting it down\n\r");
		return 1;
	}
	if (argv[1][0] = '1') xillixInitiate();
	else xillixTerminate();
	fd_is_partial = open("/sys/devices/amba.0/f8007000.ps7-dev-cfg/is_partial_bitstream", O_RDWR);
	if (fd_is_partial < 0) {
		printf("devcfg/is_partial_bitstream\n\r");
	} else {
		write(fd_is_partial, "1", 2);
		close(fd_is_partial);
	}
	return 0;
}
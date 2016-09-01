void HWA_func( int x , int y , int z , int *id , int *out ) {
	int n, first = 0, second = 1, next, c;
	*id = 123; // this is fibonache
	n = x;
	n+=y;
	n+=z;
	for ( c = 0 ; c < n ; c++ )
	{
		if ( c <= 1 )	next = c;
	    else {
	    	next = first + second;
	        first = second;
	        second = next;
	   }
	}
	*out = next;
}
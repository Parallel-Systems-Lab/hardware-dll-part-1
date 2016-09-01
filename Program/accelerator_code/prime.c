void HWA_func( int x , int *id , int *out ) {
	int n, i = 3, count, c , last;
	*id = 124; // this is prime generator
	n = x;

	   if ( n >= 1 )
	   {
	      last = 2;
	   }

	   for ( count = 2 ; count <= n ;  )
	   {
	      for ( c = 2 ; c <= i - 1 ; c++ )
	      {
	         if ( i%c == 0 )
	            break;
	      }
	      if ( c == i )
	      {
	    	  last = i;
	         count++;
	      }
	      i++;
	   }
	   *out = last;
}
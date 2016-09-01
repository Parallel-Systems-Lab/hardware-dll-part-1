void HWA_func( int x , int y , int *id , int *out ) {
	int a , b , c;
	*id = 125; // this is gcd
	a=x;
	b=y;
	  while ( a != 0 ) {
	     c = a; a = b%a;  b = c;
	  }
	  *out = b;

}



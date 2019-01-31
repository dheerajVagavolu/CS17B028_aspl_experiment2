

int check_prime(int n){

	int t = 1;
	for(int i = 2;i<n/2;i++){
		if(n%i==0){
			t=0;
		}
	}
	return t;
}

int convertPrime(int n)
{
	int i = 1;
	while(1){
		int a = n-i;
		int b = n+i;
		if(check_prime(a)==1){
			return a;
		}
		if(check_prime(b)==1){
			return b;
		}
		i++;
	}
}


int main(){
	int n = 123;
	

	int a;

	if(check_prime(n)){
		a = 3; 
	}else if(n%2==0){
		a = 1;
	}else if(n%2!=0){
		a = 2;
	}


	switch(a)
	{
		case 1: // if number is even
			n = n + 1;
			break;
		case 2: // if number is odd
			n = convertPrime(n);
			break;
		case 3: // if number is prime
			n = n + 1;
			break;
	}


}
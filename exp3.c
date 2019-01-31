

int check_prime(int n){

	int t = 1;
	for(int i = 2;i<n/2;i++){
		if(n%i==0){
			t=0;
		}
	}
	return t;
}

int main()
{
	int ar[100];
	int i = 0;
	int n = 2;
	while(n<=100){
		if(check_prime(n)){
			ar[i] = n;
			i++;
		}
		n++;
	}
}
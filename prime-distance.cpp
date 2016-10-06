#include<iostream>
using namespace std;
int main()
{
	int t = 100000000, i, j, S;
	bool *p = new bool[t + 1];
	
	for (i = 0; i <= t; i++) p[i] = true;
	
	p[0] = p[1] = false;
	for (i = 2 ; i <= t / 2; i++) {
		if(p[i]) {
			for(j = 2 * i; j <= t; j += i) {
				if(p[j]) p[j] = false;
			}
		}
	}
	
	freopen("prime.txt", "w", stdout);
	
	for (j = 2; j <= t; j += 2) {
		for (i = 2, S = 0; i + j <= t; i++) {
			if(p[i] && p[i + j]) S++;
		}
		cout << j << "\t" << S << endl;
	}
	
	fclose(stdout);
	freopen("CON", "w", stdout);
	
	return 0;
}

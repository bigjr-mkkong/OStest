#ifndef	__LIB_H__
#define __LIB_H__

#define NULL	0

int pow(int a,int b){
    int ans=1;
    while(b){
        if(b%2==1) ans=(ans*a);
        a=(a*a);
        b>>=1;
    }
    return ans;
}

#endif
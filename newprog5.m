clc;
global t vpure sample one vsag vswell vnoise vinterrupt mn vr str entr sk k 
global mean_pure var_pure std_pure entr_pure sk_pure k_pure
global mean_sag var_sag std_sag entr_sag sk_sag k_sag
global mean_swell var_swell std_swell entr_swell sk_swell k_swell
global mean_intr var_intr std_intr entr_intr sk_intr k_intr
global mean_noise var_noise std_noise entr_noise sk_noise k_noise
t=linspace(0,0.2,500);
sample=1:500;
% time 0.2 sec or 200 ms
% sampling rate 2.5 KHz
% total 500 samples
vpure=1*sin(2*pi*50*t);
% pure signal with amplitude 1 and frequency 50 Hz
one=ones(1,500);
r1=randi(500,1,50);
r2=randi(500,1,50);
c=0;
for i=1:50
   for j=1:50
       if(c<200)
        if (r2(j)>r1(i))
            c=c+1;
            r3=0.1+(0.9-0.1).*rand(1,1);
            
            %NORMAL SIGNAL
            [vpurea1,vpured1]=dwt(vpure,'db4');
            [vpurea2,vpured2]=dwt(vpured1,'db4');
            [vpurea3,vpured3]=dwt(vpured2,'db4');
            %mean
            pure_m1=mean(vpured1);
            pure_m2=mean(vpured2);
            pure_m3=mean(vpured3);
            pure_netmean=pure_m1+pure_m2+pure_m3;
            %variance
            pure_v1=var(vpured1);
            pure_v2=var(vpured2);
            pure_v3=var(vpured3);
            pure_netvar=pure_v1+pure_v2+pure_v3;
            %Standard deviation
            pure_st1=std(vpured1);                 
            pure_st2=std(vpured2);
            pure_st3=std(vpured3);
            pure_netstd=pure_st1+pure_st2+pure_st3;
            %entropy
            pure_ent1=entropy(vpured1);
            pure_ent2=entropy(vpured2);
            pure_ent3=entropy(vpured3);
            pure_netentr=pure_ent1+pure_ent2+pure_ent3;
            %skewness
            pure_sk1=skewness(vpured1);
            pure_sk2=skewness(vpured2);
            pure_sk3=skewness(vpured3);
            pure_netsk=pure_sk1+pure_sk2+pure_sk3;
            %kurtosis
            pure_k1=kurtosis(vpured1);
            pure_k2=kurtosis(vpured2);
            pure_k3=kurtosis(vpured3);
            pure_netk=pure_k1+pure_k2+pure_k3;
            
            
            mean_pure(:,c)=pure_netmean;
            var_pure(:,c)=pure_netvar;
            std_pure(:,c)=pure_netstd;    
            entr_pure(:,c)=pure_netentr;
            sk_pure(:,c)=pure_netsk;    
            k_pure(:,c)=pure_netk;
            
            %SAG
            vsag=1*(one-r3*(steps(r1(i),500)-steps(r2(j),500))).*vpure;
            [saga1,sagd1]=dwt(vsag,'db4');
            [saga2,sagd2]=dwt(sagd1,'db4');
            [saga3,sagd3]=dwt(sagd2,'db4');
            %mean
            sag_m1=mean(sagd1);
            sag_m2=mean(sagd2);
            sag_m3=mean(sagd3);
            sag_netmean=sag_m1+sag_m2+sag_m3;
            %variance
            sag_v1=var(sagd1);
            sag_v2=var(sagd2);
            sag_v3=var(sagd3);
            sag_netvar=sag_v1+sag_v2+sag_v3;
            %Standard deviation
            sag_st1=std(sagd1);                 
            sag_st2=std(sagd2);
            sag_st3=std(sagd3);
            sag_netstd=sag_st1+sag_st2+sag_st3;
            %entropy 
            sag_ent1=entropy(sagd1);
            sag_ent2=entropy(sagd2);
            sag_ent3=entropy(sagd3);
            sag_netentr=sag_ent1+sag_ent2+sag_ent3;
            %skewness 
            sag_sk1=skewness(sagd1);
            sag_sk2=skewness(sagd2);
            sag_sk3=skewness(sagd3);
            sag_netsk=sag_sk1+sag_sk2+sag_sk3;
            %kurtosis
            sag_k1=kurtosis(sagd1);
            sag_k2=kurtosis(sagd2);
            sag_k3=kurtosis(sagd3);
            sag_netk=sag_k1+sag_k2+sag_k3;
            
            mean_sag(:,c)=sag_netmean;
            var_sag(:,c)=sag_netvar;
            std_sag(:,c)=sag_netstd;    
            entr_sag(:,c)=sag_netentr;
            sk_sag(:,c)=sag_netsk;    
            k_sag(:,c)=sag_netk;
            
            
            
            %SWELL
            vswell=1*(one+r3*(steps(r1(i),500)-steps(r2(j),500))).*vpure;
            [swella1,swelld1]=dwt(vswell,'db4');
            [swella2,swelld2]=dwt(swelld1,'db4');
            [swella3,swelld3]=dwt(swelld2,'db4');
            %mean
            swell_m1=mean(swelld1);
            swell_m2=mean(swelld2);
            swell_m3=mean(swelld3);
            swell_netmean=swell_m1+swell_m2+swell_m3;
            %variance
            swell_v1=var(swelld1);
            swell_v2=var(swelld2);
            swell_v3=var(swelld3);
            swell_netvar=swell_v1+swell_v2+swell_v3;
            %Standard deviation
            swell_st1=std(swelld1);                 
            swell_st2=std(swelld2);
            swell_st3=std(swelld3);
            swell_netstd=swell_st1+swell_st2+swell_st3;
            %entropy
            swell_ent1=entropy(swelld1);
            swell_ent2=entropy(swelld2);
            swell_ent3=entropy(swelld3);
            swell_netentr=swell_ent1+swell_ent2+swell_ent3;
            %skewness
            swell_sk1=skewness(swelld1);
            swell_sk2=skewness(swelld2);
            swell_sk3=skewness(swelld3);
            swell_netsk=swell_sk1+swell_sk2+swell_sk3;
            %kurtosis
            swell_k1=kurtosis(swelld1);
            swell_k2=kurtosis(swelld2);
            swell_k3=kurtosis(swelld3);
            swell_netk=swell_k1+swell_k2+swell_k3;
            
            mean_swell(:,c)=swell_netmean;
            var_swell(:,c)=swell_netvar;
            std_swell(:,c)=swell_netstd; 
            entr_swell(:,c)=swell_netentr;
            sk_swell(:,c)=swell_netsk;    
            k_swell(:,c)=swell_netk;
            
           
            
            %INTERRUPT
            vinterrupt=1*(one-(steps(r1(i),500)-steps(r2(j),500))).*vpure;
            [intra1,intrd1]=dwt(vinterrupt,'db4');
            [intra2,intrd2]=dwt(intrd1,'db4');
            [intra3,intrd3]=dwt(intrd2,'db4');
            
            %mean
            intr_m1=mean(intrd1);
            intr_m2=mean(intrd2);
            intr_m3=mean(intrd3);
            intr_netmean=intr_m1+intr_m2+intr_m3;
            %variance
            intr_v1=var(intrd1);
            intr_v2=var(intrd2);
            intr_v3=var(intrd3);
            intr_netvar=intr_v1+intr_v2+intr_v3;
            %Standard deviation
            intr_st1=std(intrd1);                 
            intr_st2=std(intrd2);
            intr_st3=std(intrd3);
            intr_netstd=intr_st1+intr_st2+intr_st3;
            %entropy 
            intr_ent1=entropy(intrd1);
            intr_ent2=entropy(intrd2);
            intr_ent3=entropy(intrd3);
            intr_netentr=intr_ent1+intr_ent2+intr_ent3;
            %skewness
            intr_sk1=skewness(intrd1);
            intr_sk2=skewness(intrd2);
            intr_sk3=skewness(intrd3);
            intr_netsk=intr_sk1+intr_sk2+intr_sk3;
            %kurtosis
            intr_k1=kurtosis(intrd1);
            intr_k2=kurtosis(intrd2);
            intr_k3=kurtosis(intrd3);
            intr_netk=intr_k1+intr_k2+intr_k3;
           
            mean_intr(:,c)=intr_netmean;
            var_intr(:,c)=intr_netvar;
            std_intr(:,c)=intr_netstd; 
            entr_intr(:,c)=intr_netentr;
            sk_intr(:,c)=intr_netsk;    
            k_intr(:,c)=intr_netk;
                      
            
            %NOISE
            r4=randi(50,1,1);
            vnoise=vpure+(steps(r1(i),500)-steps(r2(j),500)).*(wgn(1,500,r4)/250);
            [noisea1,noised1]=dwt(vnoise,'db4');
            [noisea2,noised2]=dwt(noised1,'db4');
            [noisea3,noised3]=dwt(noised2,'db4');           
            
            %mean
            noise_m1=mean(noised1);
            noise_m2=mean(noised2);
            noise_m3=mean(noised3);
            noise_netmean=noise_m1+noise_m2+noise_m3;
            %variance
            noise_v1=var(noised1);
            noise_v2=var(noised2);
            noise_v3=var(noised3);
            noise_netvar=noise_v1+noise_v2+noise_v3;
            %Standard deviation
            noise_st1=std(noised1);                 
            noise_st2=std(noised2);
            noise_st3=std(noised3);
            noise_netstd=noise_st1+noise_st2+noise_st3;
            %entropy 
            noise_ent1=entropy(noised1);
            noise_ent2=entropy(noised2);
            noise_ent3=entropy(noised3);
            noise_netentr=noise_ent1+noise_ent2+noise_ent3;
            %skewness 
            noise_sk1=skewness(noised1);
            noise_sk2=skewness(noised2);
            noise_sk3=skewness(noised3);
            noise_netsk=noise_sk1+noise_sk2+noise_sk3;
            %kurtosis
            noise_k1=kurtosis(noised1);
            noise_k2=kurtosis(noised2);
            noise_k3=kurtosis(noised3);
            noise_netk=noise_k1+noise_k2+noise_k3;
            
            mean_noise(:,c)=noise_netmean;    
            var_noise(:,c)=noise_netvar;
            std_noise(:,c)=noise_netstd;    
            entr_noise(:,c)=noise_netentr;
            sk_noise(:,c)=noise_netsk;   
            k_noise(:,c)=noise_netk;
        end
       else
           break
       end
   end
end

mn=[mean_pure mean_sag mean_swell mean_intr mean_noise];
vr=[var_pure var_sag var_swell var_intr var_noise];
str=[std_pure std_sag std_swell std_intr std_noise]; 
entr=[entr_pure entr_sag entr_swell entr_intr entr_noise];
sk=[sk_pure sk_sag sk_swell sk_intr sk_noise]; 
k=[k_pure k_sag k_swell k_intr k_noise]; 

p=[mn(1:100) mn(201:300) mn(401:500) mn(601:700) mn(801:900) mn(101:200) mn(301:400) mn(501:600) mn(701:800) mn(901:1000)];
q=[vr(1:100) vr(201:300) vr(401:500) vr(601:700) vr(801:900) vr(101:200) vr(301:400) vr(501:600) vr(701:800) vr(901:1000)];
r=[str(1:100) str(201:300) str(401:500) str(601:700) str(801:900) str(101:200) str(301:400) str(501:600) str(701:800) str(901:1000)];
s=[entr(1:100) entr(201:300) entr(401:500) entr(601:700) entr(801:900) entr(101:200) entr(301:400) entr(501:600) entr(701:800) entr(901:1000)];
w=[sk(1:100) sk(201:300) sk(401:500) sk(601:700) sk(801:900) sk(101:200) sk(301:400) sk(501:600) sk(701:800) sk(901:1000)];
u=[k(1:100) k(201:300) k(401:500) k(601:700) k(801:900) k(101:200) k(301:400) k(501:600) k(701:800) k(901:1000)];

z=[p;q;r;s;w;u]

%TARGETS
y1=[0;0;0;0;1];
y2=[0;0;0;1;0];
y3=[0;0;1;0;0];
y4=[0;1;0;0;0];
y5=[1;0;0;0;0];
tar1=y1;
tar2=y2;
tar3=y3;
tar4=y4;
tar5=y5;
for a=1:99
 tar1=cat(2,tar1,y1);
 tar2=cat(2,tar2,y2);
 tar3=cat(2,tar3,y3);
 tar4=cat(2,tar4,y4);
 tar5=cat(2,tar5,y5);
end
tar=[tar1 tar2 tar3 tar4 tar5 tar1 tar2 tar3 tar4 tar5]



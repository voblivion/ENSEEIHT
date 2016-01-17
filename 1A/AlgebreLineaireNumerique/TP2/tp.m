clear all
close all
n=4;
U=gallery('orthog',n);
D=diag(ones(n,1));
i=1;
for k=16:32
  %TO DO: modifier D pour obtenir A tel K(A)=10^k
  D(n,n) = 10^k;
  A=U*D*U';

  %Gram-Schmidt classique 
  Qcgs=cgs(A);
  Qcgs2=cgs(Qcgs);
  Qcgs3=cgs(Qcgs2);

  %Gram-Schmidt modifié
  Qmgs = mgs(A);
  Qmgs2 = mgs(Qmgs);
  Qmgs3 = mgs(Qmgs2);

  po(1,k)=norm(eye(n)-Qcgs2'*Qcgs2);
  po(2,k)=norm(eye(n)-Qmgs2'*Qmgs2);
  po(3,k)=norm(eye(n)-Qcgs3'*Qcgs3);
  po(4,k)=norm(eye(n)-Qmgs3'*Qmgs3);
end
semilogy(po(1,:),'r')
hold on
semilogy(po(2,:),'b')
hold on
semilogy(po(3,:),'g')
hold on
semilogy(po(4,:),'black')
legend('CGS','MGS', 'CGS2', 'MGS2');
xlabel('logarithm of the condition number of A_k')
ylabel('|| I - Q_k^TQ_k ||')

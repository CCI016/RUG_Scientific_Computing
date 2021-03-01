%PART 2 E

function x = ISCpagerank2(G,p)
if nargin < 3, p = .85; end


G = G - diag(diag(G));

n = size(G,2);
c = sum(G,1);

k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);

e = ones(n,1);
I = speye(n,n);
x = (I - p * G * D) \ e;

x = x / sum(x);

x = sort(x,'descend');

end
function dZ = dZ_hill(x,y,z,g,a,k,n)
%DZ_HILL functional equations for the change in Z

dZ = a(2).*((...
(((x.^n(4)./(k(4).^n(4)+x.^n(4))).^(g(4)^2.*((g(4)+1)/2)).*((k(4).^n(4)+x.^n(4))/k(4).^n(4)).^(g(4)^2*((g(4)-1)/2)))./...
    ((1./(k(4).^n(4)+1)).^(g(4)^2.*((g(4)+1)/2)).*((k(4).^n(4)+1)/k(4).^n(4)).^(g(4)^2*((g(4)-1)/2)))).*... %x--z
(((y.^n(5)./(k(5).^n(5)+y.^n(5))).^(g(5)^2.*((g(5)+1)/2)).*((k(5).^n(5)+y.^n(5))/k(5).^n(5)).^(g(5)^2*((g(5)-1)/2)))./...
    ((1./(k(5).^n(5)+1)).^(g(5)^2.*((g(5)+1)/2)).*((k(5).^n(5)+1)/k(5).^n(5)).^(g(5)^2*((g(5)-1)/2)))).*... %y--z
(((z.^n(6)./(k(6).^n(6)+z.^n(6))).^(g(6)^2.*((g(6)+1)/2)).*((k(6).^n(6)+z.^n(6))/k(6).^n(6)).^(g(6)^2*((g(6)-1)/2)))./...
    ((1./(k(6).^n(6)+1)).^(g(6)^2.*((g(6)+1)/2)).*((k(6).^n(6)+1)/k(6).^n(6)).^(g(6)^2*((g(6)-1)/2)))))... %z--z
-z);
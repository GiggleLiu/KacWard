include("./lattice.jl")

N = 6
�� = 1.0 
�� = tanh(��)
�� = exp(im*pi/4)*��
u�� = [[�� �� 0 conj(��)]; 
      [0  0  0  0];
      [0  0  0  0];
      [0  0  0  0];
     ]

u�� = [[0  0  0  0];
      [conj(��) �� �� 0]; 
      [0  0  0  0];
      [0  0  0  0];
     ]

u�� = [[0  0  0  0];
      [0  0  0  0];
      [0 conj(��) �� ��]; 
      [0  0  0  0];
     ]

u�� = [[0  0  0  0];
      [0  0  0  0];
      [0  0  0  0];
      [�� 0 conj(��) ��];
     ]

#Neighbor table
Nbr = build_Nbr(N)

U = zeros(4*N)
for k in 1:N
    for n in 1:N
        j = 4*(k-1) + n 
        U[j, j] = 1
        for nprime in 1:4
            #right 
            kprime = Nbr[1, k]
            if kprime != 0
                jprime = 4*(kprime -1) + nprime
                U[j, jprime] = u��[n, nprime]
            end
            #up
            kprime = Nbr[2, k]
            if kprime != 0
                jprime = 4*(kprime -1) + nprime
                U[j, jprime] = u��[n, nprime]
            end
            #left
            kprime = Nbr[3, k]
            if kprime != 0
                jprime = 4*(kprime -1) + nprime
                U[j, jprime] = u��[n, nprime]
            end
            #down
            kprime = Nbr[4, k]
            if kprime != 0
                jprime = 4*(kprime -1) + nprime
                U[j, jprime] = u��[n, nprime]
            end
        end
    end 
end

println(0.5* logabsdet(U)[1] )

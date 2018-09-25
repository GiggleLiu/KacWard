N = 6
�� = 1.0 
�� = tanh(beta)
�� = exp(im*pi/4) * ��
u�� = [[�� a 0 conj(��)]; 
      [0  0  0  0];
      [0  0  0  0];
      [0  0  0  0]
     ]

u�� = [[0  0  0  0];
      [conj(��) �� �� 0]; 
      [0  0  0  0];
      [0  0  0  0]
     ]

u�� = [[0  0  0  0];
      [0  0  0  0];
      [0 conj(��) �� ��]; 
      [0  0  0  0]
     ]

u�� = [[0  0  0  0];
      [0  0  0  0];
      [0  0  0  0];
      [�� 0 conj(��) ��]
     ]

#Neighbor table
Nbr = zeros(N)
for k in 0:N*N-1
    x = div(k, N)
    y = rem(k, N) 
        
    #right
    if x+1 < N-1
        Nbr[1, k] = (x+1)*N + y +1 
    end

    #up 
    if y+1 < N-1
        Nbr[2, k] = x*N + (y+1) +1
    end

    #left
    if x-1 > 0
        Nbr[3, k] = (x-1)*N + y +1
    end

    #down
    if y+1 < N-1
        Nbr[4, k] = x*N + (y-1) +1
    end
end

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

println(sqrt(det(U)))

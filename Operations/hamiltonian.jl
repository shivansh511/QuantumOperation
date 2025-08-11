using LinearAlgebra


X=Matrix{ComplexF64}([0 1; 1 0])
Y=Matrix{ComplexF64}([0 -1im; 1im 0])
Z=Matrix{ComplexF64}([1 0; 0 -1])
I=Matrix{ComplexF64}([1 0; 0 1])

function TFI(N::Int, dim::Int=2)

    H=zeros(ComplexF64, dim^N, dim^N)
    matrix_list=fill(I, N)
    matrix_list[1]=Z
    matrix_list[2]=Z

    println(matrix_list)
    matrix_list=circshift(matrix_list,1)
    println(matrix_list)
    
    for i in 1:N-1
        H += foldl(kron, matrix_list)
        matrix_list = circshift(matrix_list, 1)
    end
    
    return H
end

struct system
    N::Int
    H::Matrix{ComplexF64}
end

sys=system( 2, TFI(2))

println(sys.H)

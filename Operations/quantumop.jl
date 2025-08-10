using LinearAlgebra


#= 
Function to calculate the Von-Neumann Entropy of a pure state.
=#
function VNEntropy(psi::Vector{T}, 
                    sys_size::Int=4, 
                    dim::Int=2)::T where T
    entropy::T=0

    new_psi=reshape(psi, (dim,dim))
    _,S,_=svd(new_psi)
 
    for a in S
        if a > 1e-05
            entropy+=log2(a)
        end
    end

    return -entropy
end

state::Vector{Float64}=[1/sqrt(2),0,0,1/sqrt(2)]

entropy=VNEntropy(state)
println(entropy)

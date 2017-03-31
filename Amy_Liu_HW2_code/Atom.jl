# To generate Atom matrix

include("Include.jl")

data_dictionary = DataDictionary(0,0,0)
include("Bounds.jl")

# Create Atom matrix and transpose it
Atom_matrix=generate_atom_matrix("Atom.txt",data_dictionary);
transpose_atom_matrix= Atom_matrix'
stoichiometric_matrix = data_dictionary["stoichiometric_matrix"]
rxn_string=data_dictionary["list_of_reaction_strings"]

data_dictionary["objective_coefficient_array"][12] = -1;
data_dictionary = Bounds(data_dictionary);
(objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)

net_rxn= generate_net_reaction_string(uptake_array,0.1,data_dictionary)

residule=transpose_atom_matrix*stoichiometric_matrix*flux_array

RXN=transpose_atom_matrix*stoichiometric_matrix
(number_atom,number_rxn) = size(RXN)

for i = 1:number_rxn
  if (sum(abs(RXN[:,i])) !=0)
    println("reaction$i "* rxn_string[i]*" "*string(RXN[:,i]))
  end
end





# ListOfReactionStrings = data_dictionary["list_of_reaction_strings"]
# # analyze atom-balance of each reaction
# NetAtomOfEachReaction = AtomArray'*data_dictionary["stoichiometric_matrix"]
# (NumOfAtom, NumOfRnx) = size(NetAtomOfEachReaction)
# SumNetAtomOfEachRnx = zeros(1, NumOfRnx)
# for i = 1:NumOfRnx
#   if (sum(abs(NetAtomOfEachReaction[:,i])) != 0)
#     println("reaction$i "*ListOfReactionStrings[i]*" "*string(NetAtomOfEachReaction[:,i]))
#   end
# end

# file_path="Atom_matrix.dat"
#
# writedlm(file_path,Atom_matrix)

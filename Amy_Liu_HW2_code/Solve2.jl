include("Include.jl")
include("Bounds.jl")
# load the data dictionary -
data_dictionary = DataDictionary(0,0,0)

# solve the lp problem -
#Set objective reaction
data_dictionary["objective_coefficient_array"][12] = -1;

data_dictionary = Bounds(data_dictionary);
# solve the lp problem -
(objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)

# Create Atom matrix and transpose it

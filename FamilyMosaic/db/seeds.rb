# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# Profiles:
# User.create({:email => "guy@gmail.com", :password => "12345678", :password_confirmation => "12345678" })
# Profile.create([
# 	{ first_name: 'dummy', last_name: 'Mayer', sex: 'male', family_id: '1', user_id: '1'},
# 	{ first_name: 'Hedwig', last_name: 'Mayer', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Winifred', last_name: 'Wolfe', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'May', last_name: 'Stephenson', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Ifeoma', last_name: 'Collier', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Dorothy', last_name: 'Emerson', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Amos', last_name: 'Mercado', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Olivia', last_name: 'Pittman', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Reece', last_name: 'Simpson', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Yeo', last_name: 'West', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Halla', last_name: 'Summers', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Kennedy', last_name: 'Snow', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Haviva', last_name: 'Vega', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Kieran', last_name: 'Medina', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Moses', last_name: 'Walter', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Margaret', last_name: 'Owen', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Wayne', last_name: 'Blankenship', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Karen', last_name: 'Brock', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Fatima', last_name: 'Cantu', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Isaac', last_name: 'Stuart', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Rahim', last_name: 'Rodgers', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Chloe', last_name: 'Abbott', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Hamilton', last_name: 'Lynn', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Dominic', last_name: 'Dillard', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Kellie', last_name: 'Sanford', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Yolanda', last_name: 'Graham', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Larissa', last_name: 'Mcclain', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Aileen', last_name: 'Burgess', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Xaviera', last_name: 'Clark', sex: 'female', family_id: '1'}, 
# 	{ first_name: 'Marah', last_name: 'Hutchinson', sex: 'male', family_id: '1'}, 
# 	{ first_name: 'Timon', last_name: 'Moran', sex: 'female', family_id: '1'}
# ])
Relationship.create([
	{r_type: 'child'}, 
	{r_type: 'spouse'}, 
	{r_type: 'divorced'}, 
	{r_type: 'stepchild'}
])
# Tree.create([
# 	{ profile1_id: '2', profile2_id: '3', relationship_id: '1'}, 
# 	{ profile1_id: '31', profile2_id: '2', relationship_id: '2'},
# 	{ profile1_id: '2', profile2_id: '4', relationship_id: '1'},
# 	{ profile1_id: '2', profile2_id: '5', relationship_id: '1'},
# 	{ profile1_id: '2', profile2_id: '6', relationship_id: '1'},
# 	{ profile1_id: '6', profile2_id: '7', relationship_id: '1'},
# 	{ profile1_id: '6', profile2_id: '8', relationship_id: '1'},
# 	{ profile1_id: '9', profile2_id: '6', relationship_id: '2'},
# 	{ profile1_id: '10', profile2_id: '2', relationship_id: '1'},
# 	{ profile1_id: '11', profile2_id: '10', relationship_id: '2'},
# 	{ profile1_id: '10', profile2_id: '12', relationship_id: '1'},
# 	{ profile1_id: '11', profile2_id: '13', relationship_id: '1'},
# 	{ profile1_id: '11', profile2_id: '14', relationship_id: '1'},
# 	{ profile1_id: '14', profile2_id: '15', relationship_id: '2'},
# 	{ profile1_id: '14', profile2_id: '16', relationship_id: '1'},
# 	{ profile1_id: '14', profile2_id: '17', relationship_id: '1'},
# 	{ profile1_id: '18', profile2_id: '20', relationship_id: '1'},
# 	{ profile1_id: '19', profile2_id: '18', relationship_id: '2'},
# 	{ profile1_id: '10', profile2_id: '19', relationship_id: '1'},
# 	{ profile1_id: '19', profile2_id: '21', relationship_id: '1'},
# 	{ profile1_id: '21', profile2_id: '22', relationship_id: '1'},
# 	{ profile1_id: '21', profile2_id: '23', relationship_id: '1'},
# 	{ profile1_id: '21', profile2_id: '24', relationship_id: '1'},
# 	{ profile1_id: '21', profile2_id: '25', relationship_id: '1'},
# 	{ profile1_id: '25', profile2_id: '26', relationship_id: '1'},
# 	{ profile1_id: '25', profile2_id: '27', relationship_id: '1'},
# 	{ profile1_id: '27', profile2_id: '28', relationship_id: '1'},
# 	{ profile1_id: '28', profile2_id: '29', relationship_id: '1'},
# 	{ profile1_id: '29', profile2_id: '30', relationship_id: '1'},
# 	{ profile1_id: '2', profile2_id: '1', relationship_id: '1'}
# ])
  
   

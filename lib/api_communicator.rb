# require 'unirest'
# require 'json'
# # require 'rapidapisdk'
# # RapidAPI.config(project:'distancegame_5a820357e4b0a62b51d01d50',token: '/connect/auth/distancegame_5a820357e4b0a62b51d01d50');
#
#
# response = Unirest.get "https://wft-geo-db.p.mashape.com/v1/geo/cities?minPopulation=2500000",
#   headers:{
#     "X-Mashape-Key" => "90q3bZNIjFmshdNide3O7yeUx4jtp1PVnbujsn7xBiia0heUAY",
#     "X-Mashape-Host" => "wft-geo-db.p.mashape.com"
#   }
# response = response.body
# puts response


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

require 'nokogiri'
require 'open-uri'

#Acessa  a url 
doc = Nokogiri::HTML(URI.open('https://pt.stardewvalleywiki.com/Alde%C3%B5es'))

# elemento html que contém o nome dos villagers
villagers = doc.css("ul.gallery.mw-gallery-packed.villagergallery").css("li.gallerybox").css(".gallerytext").css("p")

#Abre arquivo de texto pra salvar os dados do site
open("villagers.txt", "w") do | arquivo |

	# array com o nome de cada um dos villagers
	villagers_names = Array.new

	#pega cada um dos villagers e salva no array
	villagers.search("a").each do | villager |
		villagers_names.push(villager.text)
	end

	#salva cada um dos villagers no arquivo de texto
 	arquivo.puts villagers_names
 end


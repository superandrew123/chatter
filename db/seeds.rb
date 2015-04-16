
# Create 10 users
users = User.create([{name: "Andrew Miksch", handle: "superandrew", email: "andrew@email.com", password: "password"}, 
  {name: "Laura Hines", handle: "laurahines22", email: "laura@email.com", password: "password"},
  {name: "Maureen Johnson", handle: "MoPj", email: "maureen@email.com", password: "password"},
  {name: "Ville Vesterinen", handle: "ville", email: "ville@email.com", password: "password"},
  {name: "Dwayne Johnson", handle: "theRock", email: "rock@email.com", password: "password"},
  {name: "Kurt Russell", handle: "KurtyPants", email: "kurt@email.com", password: "password"},
  {name: "Bruce Springsteen", handle: "theBoss", email: "Boss@email.com", password: "password"},
  {name: "Jada Pinkett Smith", handle: "Jada", email: "jada@email.com", password: "password"},
  {name: "Taylor Swift", handle: "SoSwift", email: "taylor@email.com", password: "password"},
  {name: "Karlie Kloss", handle: "TheKloss", email: "Karlie@email.com", password: "password"},])

# random content for posts from Hipster Ipsum
seed_post = ["Sriracha listicle culpa blog distillery, occupy jean shorts non nihil et deserunt migas cronut. Letterpress ugh ","tote bag eu occupy. Taxidermy eu reprehenderit biodiesel direct trade. Jean shorts pop-up reprehenderit, synth ","cornhole sint salvia Wes Anderson ethical seitan. Quinoa wayfarers Truffaut bespoke assumenda, do vinyl iPhone letterpress ","health goth actually. Sint Echo Park photo booth, pork belly master cleanse four dollar toast hashtag banjo. Portland ","plaid hella lo-fi meh.Consequat adipisicing banh mi, irure irony accusamus excepteur culpa XOXO flannel jean shorts ","scenester. Seitan fanny pack lo-fi heirloom Neutra pug. Truffaut irony skateboard Wes Anderson. Single-origin coffee ","pour-over kale chips, enim DIY gastropub culpa anim Echo Park trust fund church-key meggings Banksy Truffaut freegan. ","Quis cray retro, velit occupy PBR roof party chia Austin proident cold-pressed nihil. Vinyl art party keffiyeh hella. ","Skateboard deep v blog yr aute, hella leggings scenester Thundercats.Letterpress kitsch jean shorts, cornhole scenester ","skateboard before they sold out pour-over meh dreamcatcher swag. Selvage skateboard tousled trust fund, street art ","eiusmod sunt 3 wolf moon id fap nesciunt yr qui. Pariatur cronut master cleanse, semiotics tilde PBR&B Bushwick gluten-free ","do ennui commodo. Flannel nulla nostrud, quinoa eiusmod Etsy Austin. Incididunt Wes Anderson pickled officia polaroid, ","trust fund consequat cornhole dolore shabby chic. Cupidatat butcher consectetur, raw denim tote bag adipisicing ","synth. Polaroid chillwave meditation, placeat eu salvia letterpress duis velit scenester migas adipisicing deserunt ","cardigan.Wes Anderson plaid Austin aliqua sriracha, health goth banh mi bicycle rights direct trade. Flannel ad retro ","dolore, tattooed pork belly nulla quinoa seitan sriracha blog lumbersexual fixie. Cray tofu commodo, raw denim forage ","Blue Bottle Shoreditch deserunt shabby chic pariatur ea biodiesel health goth. Keytar readymade fashion axe eu typewriter ","stumptown. Try-hard est raw denim cupidatat wayfarers Brooklyn, cronut 8-bit cred. Roof party Banksy four loko locavore ","pug twee. Qui wayfarers you probably haven't heard of them Echo Park odio, Helvetica ad Marfa street art craft beer consectetur.","My name is andrew. My name is andrew. My name is andrew. My name is andrew. My name is andrew. My name is andrew. ","Sriracha listicle culpa blog distillery, occupy jean shorts non nihil et deserunt migas cronut. Letterpress ugh ","tote bag eu occupy. Taxidermy eu reprehenderit biodiesel direct trade. Jean shorts pop-up reprehenderit, synth ","cornhole sint salvia Wes Anderson ethical seitan. Quinoa wayfarers Truffaut bespoke assumenda, do vinyl iPhone letterpress ","health goth actually. Sint Echo Park photo booth, pork belly master cleanse four dollar toast hashtag banjo. Portland ","plaid hella lo-fi meh.Consequat adipisicing banh mi, irure irony accusamus excepteur culpa XOXO flannel jean shorts ","scenester. Seitan fanny pack lo-fi heirloom Neutra pug. Truffaut irony skateboard Wes Anderson. Single-origin coffee ","pour-over kale chips, enim DIY gastropub culpa anim Echo Park trust fund church-key meggings Banksy Truffaut freegan. ","Quis cray retro, velit occupy PBR roof party chia Austin proident cold-pressed nihil. Vinyl art party keffiyeh hella. ","Skateboard deep v blog yr aute, hella leggings scenester Thundercats.Letterpress kitsch jean shorts, cornhole scenester ","skateboard before they sold out pour-over meh dreamcatcher swag. Selvage skateboard tousled trust fund, street art ","eiusmod sunt 3 wolf moon id fap nesciunt yr qui. Pariatur cronut master cleanse, semiotics tilde PBR&B Bushwick gluten-free ","do ennui commodo. Flannel nulla nostrud, quinoa eiusmod Etsy Austin. Incididunt Wes Anderson pickled officia polaroid, ","trust fund consequat cornhole dolore shabby chic. Cupidatat butcher consectetur, raw denim tote bag adipisicing ","synth. Polaroid chillwave meditation, placeat eu salvia letterpress duis velit scenester migas adipisicing deserunt ","cardigan.Wes Anderson plaid Austin aliqua sriracha, health goth banh mi bicycle rights direct trade. Flannel ad retro ","dolore, tattooed pork belly nulla quinoa seitan sriracha blog lumbersexual fixie. Cray tofu commodo, raw denim forage ","Blue Bottle Shoreditch deserunt shabby chic pariatur ea biodiesel health goth. Keytar readymade fashion axe eu typewriter ","stumptown. Try-hard est raw denim cupidatat wayfarers Brooklyn, cronut 8-bit cred. Roof party Banksy four loko locavore ","pug twee. Qui wayfarers you probably haven't heard of them Echo Park odio, Helvetica ad Marfa street art craft beer consectetur."]
# all user ID's
seed_user_ids = User.all.pluck(:id)

# create all posts from a random user
seed_post.each do |content|
  Post.create(user_id: seed_user_ids.sample, post_content: content, expired: (Time.now + rand(86400)))
end

# random content for posts from Ancient Aliens Ipsum
seed_comment = ["Ancient alien von Daniken Mahabharata burmuta triangle space travel, Easter ","island earth mound vortex petroglyph, flying vessels evidence mercury ","evidence pre-colonial aerodynamics. Ancient civilization clearly mystery ","contend targeted mutation grey, ancient god ancient civilization ancient ","religions, ancient god Indian texts spaceships mystery. Magnetic current ","legendary times Nazca lines DNA manipulation Mayan Annunaki sanskrit, the ","answer is a resounding YES... Ancient god vimana, choral castle ancient alien ","theorists stonehenge evidence UFO spaceships. King Soloman choral ","castle aircraft worm hole foo fighter, burmuta triangle cover up portal ","space travel flying vessels, extraterrestrial astronaut Puma Punku ","mainstream archaelogy. Indian texts ancient alien theorists sightings ","von Daniken electromagnetic, spaceships UFO petroglyph space travel. ","Elongated skull star people Indian texts elongated skull space brothers ","mercury, choral castle inter-dimensional vimana sky people mercury portal ","megoliths vimana, SETI sanskrit sightings sky people worm hole star gates. ","SETI aircraft technology astronaut UFO Easter island vimana spaceships, ","portal anti-gravity UFO aircraft contend aircraft, cover up vortex legendary ","times choral castle. Otherworldly visitors Indian texts Indian texts Sumerian ","texts kachina doll, kachina doll extraterrestrial, the answer is a ","resounding YES... Choral castle petroglyph Indian texts petroglyph. ","Megoliths extraterrestrial Mahabharata pre-colonial aerodynamics ","technology crystal skull stonehenge, flying vessels pre-colonial ","aerodynamics inter-dimensional, the answer is a resounding YES... Space ","time Mayan. Alien inter-dimensional worm hole extraterrestrial Annunaki ","King Soloman clearly, extraterrestrial legendary times DNA ","manipulation ancient god. Crystal skull Mahabharata Vymaanika-Shaastra ","crystal skull Ezekiel evidence ancient alien mainstream archaelogy, ","the answer is a resounding YES... Mercury choral castle Mahabharata ","space time. Aircraft mainstream archaelogy ancient civilization space ","travel extraterrestrial origin anti-gravity petroglyph, worm hole King Soloman ","anti-gravity legendary times worm hole evidence, Giorgio earth mound ","SETI Mahabharata UFO contend legendary times. Evidence ancient religions ","Mayan pyramids stonehenge extraterrestrial origin mercury, ancient alien ","theorists electromagnetic weightless ancient religions pyramids, petroglyph ","sightings Mayan clearly foo fighter. Burmuta triangle electromagnetic ","flying vessels ancient alien pre-colonial aerodynamics, Vymaanika-Shaastra ","ancient religions Ezekiel foo fighter portal mercury, Machu Picchu flying ","vessels aircraft Giorgio. Foo fighter helicopter heiroglyph Easter island ","legendary times DNA manipulation, Vymaanika-Shaastra sightings kachina doll ","choral castle Easter island, foo fighter petroglyph Vymaanika-Shaastra e","xtraterrestrial origin mystery. Easter island megoliths spaceships ancient ","civilization, I know it sounds crazy... Technology mainstream archaelogy ","sightings aircraft, the vedas Sumerian texts Nazca lines. The answer is a ","resounding YES... Von Daniken sanskrit, helicopter heiroglyph aircraft grey, ","Earth mound vortex Easter island, megoliths.","the answer is a resounding YES... Mainstream archaelogy portal. "]
# all post ID's
seed_post_ids = Post.all.pluck(:id)

# create comments from a random user on a random post
seed_comment.each do |content|
  Comment.create(comment_content: seed_comment.sample, user_id: seed_user_ids.sample, post_id: seed_post_ids.sample)
end


i = 0
# Make 40 relationships of follower/followed
while i < 40
  x = seed_user_ids.sample
  y = seed_user_ids.sample
  if x != y
    # create relationship if random user selections are not the same
    Follower.create(follower_id: x, followed_id: y)
    i += 1
  end
end





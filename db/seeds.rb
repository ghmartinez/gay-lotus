Mission.destroy_all
Bungalow.destroy_all
User.destroy_all
Challenge.destroy_all

puts "Creating challenges..."
challenges = [
  "Conseguir que target se haga una selfie contigo.",
  "Conseguir que target se apunte a algun grupo nuevo de QWERTY.",
  "Conseguir que target se pruebe una camiseta tuya.",
  "Conseguir que target te prepare una bebida.",
  "Conseguir que target te agregue a algún grupo de Whatsapp / Telegram donde no estuvieras.",
  "Conseguir que target te ponga en su equipo en alguna actividad.",
  "Conseguir que target entre a un bungalow que no sea el suyo.",
  "Conseguir que target diga PALEOLÍTICO en voz alta.",
  "Conseguir que target haga pis en el mar.",
  "Conseguir que target te ponga protector solar en alguna parte del cuerpo.",
  "Conseguir que target te recomiende un libro para leer.",
  "Conseguir que target te haga escuchar una canción desde su movil.",
  "Conseguir que target te diga la parte de su cuerpo que menos le gusta.",
  "Conseguir que target te de un beso en la mejilla.",
  "Conseguir que target te haga un masaje en el cuello.",
  "Conseguir que target te diga el nombre de una planta.",
  "Conseguir que target te hable de alguna mascota que haya tenido él / ella / elle o alguien cercano.",
  "Conseguir que target te enseñe una foto de su ex (novio/a o ligue). Si no tuviera, que te enseñe alguna foto suya.",
  "Conseguir que target te enseñe una foto de su hermano/a o padres.",
  "Conseguir que target te cuente de su destino de viaje soñado.",
  "Conseguir que target te diga 3 de sus platos favoritos.",
  "Conseguir que target te deje acostarte en su tumbona / toalla / manta.",
  "Conseguir que target te hable de un plato tipico de su ciudad de origen.",
  "Conseguir que target te dibuje algo en alguna parte del cuerpo con un boli / marcador.",
  "Conseguir que target te cuente una hisotria de cuando iba al colegio.",
  "Conseguir que target cuente un chiste estando tú presente.",
  "Conseguir que target te preste 1 euro (devuélveselo!!!).",
  "Conseguir que target te deje hacer una llamada de teléfono desde su móvil.",
  "Conseguir que target te envíe una foto al móvil (por Email, Whatsapp, Instagram, o como sea).",
  "Conseguir que target te haga una cuenta matemática (SIN USAR EL MÓVIL).",
  "Conseguir que target te cante un fragmento de una canción.",
  "Conseguir que target te diga algo que le gusta de Barcelona y algo que NO le guste de Barcelona.",
  "Conseguir que target te diga cuál seria su ciudad favorita para vivir (que no sea la que vive actualmente).",
  "Conseguir que target te dé un abrazo (debe ser consensuado!!!).",
  "Conseguir que target te diga a qué edad tuvo su primer beso.",
  "Conseguir que target te cuente de cuando salió del armario con alguien.",
  "Conseguir que target te haga upa (o él / ella a ti) (debe ser consensuado!!!).",
  "Conseguir que target se siente a tu lado en alguna comida o actividad. Debe ser esta persona quien se siente en segundo lugar. No puedes sentarte tú a su lado.",
  "Conseguir que target te deje probar uno de sus pantalones.",
  "Conseguir que target te pregunte algo del perfume que llevas (el nombre, si es caro, dónde se consigue, si lo llevas desde pequeño, lo que sea).",
  "Conseguir que target te pregunte algo sobre tu trabajo / carrera.",
  "Conseguir que target te diga si le agradan u odia los parques de diversiones.",
  "Conseguir que target te traduzca una frase relativa al camping a otro idioma que no sea catalán / castellano.",
  "Conseguir que target te recomiende una serie que NO hayas visto en Netflix (o plataforma similar).",
  "Conseguir que target te recomiende una serie que YA hayas visto en Netflix (o plataforma similar).",
  "Conseguir que target te diga todos los ingredientes que lleva un mojito (azúcar, menta o hierbabuena, lima, ron, hielo, soda o agua con gas).",
  "Conseguir que target te cuente cuál es su playa favorita de Barcelona."
  ]

challenges.each do |challenge|
  Challenge.create(description: challenge)
end
puts "Challenges created!"

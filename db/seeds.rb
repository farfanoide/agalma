# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
_cent_desc = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, aliquam, magni reiciendis quas voluptatum soluta harum quo dignissimos aut. Veritatis, assumenda distinctio modi dignissimos unde rem enim voluptas consequatur aliquam!'

Branch.create!(name: 'Centro Terapeutico Educativo', description:_cent_desc, zone: 'partido de General San Martin, Prov. de Buenos Aires', zipcode:1655 , address: 'Lacroze 7259 - Jose Leon Suarez', email:'info@centroagalma.com.ar' )
Branch.create!(name: 'Atencion Terapeutica Interdisciplinaria', description:_cent_desc, zone:'Capital Federal', zipcode:1405, email:'consultorios@centroagalma.com.ar', address:'Aranguren 561 - P. B. "A"'  )
Branch.create!(name: 'mecanica', description: 'le arreglamo el auto donia')


Telephone.create!(ext:'011', num:'49032888', branch_id: Branch.find_by(name: 'Centro Terapeutico Educativo').id )
Telephone.create!(ext:'011', num:'47208195', branch_id: Branch.find_by(name: 'Atencion Terapeutica Interdisciplinaria').id)

_pass = "12345678"
User.create!(name: 'erica', email: 'sanchezvitale@gmail.com', password: _pass, admin: true)
User.create!(name: 'veronica', email: 'veruhkieck@gmail.com', password: _pass, admin: true)
User.create!(name: 'ivan', email: 'ivan6258@gmail.com', password: _pass, admin: true)
User.create!(name: 'fernan', email: 'fernan.nestier@gmail.com', password: _pass, admin: true)
User.create!(name: 'administrador', email: 'admin@centroagalma.com.ar', password: _pass, admin: true)
User.create!(name: 'maria victoria', email: 'toia_gf@hotmail.com', password: _pass, admin: true)

Role.create!(name: 'visitante', description: 'usuario con menos privilegios')
Role.create!(name: 'moderador', description: 'privilegios de lectura y modificacion')
Role.create!(name: 'admin', description: 'Todos los privilegios')

_admin = Role.find_by!(name: 'admin')
Rolification.create!(user: User.find_by!(name: 'veronica'), branch: Branch.find(1), role: _admin)
Rolification.create!(user: User.find_by!(name: 'erica'), branch: Branch.find(1), role: _admin)
Rolification.create!(user: User.find_by!(name: 'maria victoria'), branch: Branch.find(1), role: _admin)
Rolification.create!(user: User.find_by!(name: 'ivan'), branch: Branch.find(1), role: _admin)
Rolification.create!(user: User.find_by!(name: 'fernan'), branch: Branch.find(1), role: _admin)

_quienes_body = "<p>Los Centros en Salud Mental Agalma están al servicio de la sociedad. Prestan  una amplia cobertura asistencial y terapéutica que permite dar respuesta a las diversas problemáticas propias de la niñez, la infancia y la adolescencia, con un enfoque especializado y un criterio integral, en las áreas de psicología, musicoterapia, psicopedagogía, terapia ocupacional, psicomotricidad, nutrición, kinesiología y asistencia social,  promoviendo la excelencia en la calidad de los tratamientos, la optimización de los recursos y sustentando una particular práctica transdisciplinaria, que incluye la orientación y apoyo a las familias. También cuenta con el área de formación profesional dedicada a la enseñanza, trasmisión y capacitación de profesionales de la salud, sobre distintas temáticas de incidencia eminentemente clínica, relacionadas con los campos disciplinarios que abarca nuestro Equipo.</p>"
Page.create!(title: "quienes somos", body: _quienes_body)

_centros_terapeuticos_body = "<p>Nuestro centro trabaja con profesionales de diferentes disciplinas de la salud mental y&nbsp; médicas. Bajo un particular enfoque transdisciplinario cada profesional trabaja con las herramientas propias de su disciplina, pero comparte con el resto del equipo la misma lógica y direccionalidad de tratamiento. Desde cada especificidad disciplinaria, apostamos en todos los casos a la mayor autonomía y al menor grado de padecimiento posibles de cada paciente.</p><p>Se brindan tratamientos personalizados y grupales en todos los casos.</p><h2>Orientación y Apoyo Familiar:</h2><p>Se realizan entrevistas familiares periódicas, según los requerimientos del caso, con una frecuencia quincenal. Se brinda a los padres y familiares de los pacientes contención y apoyo, al mismo tiempo que se complementa la actividad asistencial, trabajando sobre aquellas cuestiones familiares que están implicadas en la estrategia y la dirección del tratamiento del paciente.</p><h3>Nuestros objetivos&nbsp;</h3><p>Generar en el paciente la emergencia de una posición subjetiva, opuesta a la de la alienación y mecanización del comportamiento y en dirección a lograr la mayor autonomía personal posible.</p><p>Fomentar el consentimiento del paciente hacia la producción y el establecimiento de un lazo social que le permita la habilitación e inserción en su medio habitual desde una posición nueva singularmente creada.</p><p>Ofrecer al sujeto un marco institucional donde pueda desplegar y alojar un trabajo bio-psico-social sobre aquello que lo hace padecer.</p><p>Apoyar y orientar al grupo familiar del paciente.</p><p>En función de su singularidad, viabilizar un accionar saludable del paciente&nbsp; en su vida cotidiana y en el desarrollo de actividades y conocimientos ocupacionales con fines de participación social y laboral, a través de la implementación de actividades tendientes a alcanzar el máximo desarrollo posible de sus potencialidades.&nbsp;</p><p>Plantear estrategias que posibiliten alcanzar el mayor nivel de autovalimiento e integración psicosocial, respetando las características propias de cada paciente.</p>"
Page.create!(title: "centros terapeuticos educativos", body: _centros_terapeuticos_body)

_centro_estimulacion_temprana = "[cargar informacion]"
Page.create!(title: "centro de estimulacion temprana", body: _centro_estimulacion_temprana)


_boca_content = "<p>Teniendo en cuenta la importancia de generar espacios fuera de la institución y poder tomar algo muy propio de cada uno de los chicos e ir trabajando en función de ello, durante el mes de octubre Martín y Matías, ambos hinchas de boca y muy futboleros, con sus padres y  los terapeutas Diego y Claudio, conocieron la Bombonera y partes históricas de la Ciudad de Buenos Aires.  A partir de una propuesta de la asistente social Sabrina, quien a través de la municipalidad y las excursiones abiertas a instituciones trajo la propuesta, se tomó la decisión de que Matías, fanático del futbol y quien conoce a todos a través de este deporte, llamando a los terapeutas, Diego el gallina o Hernán el cuervo, junto Martín a quien le encanta esta disciplina y se desenvuelve muy bien en las salidas, conocieron el museo de la pasión boquense y el estadio.  Comenzó el viaje con el acompañamiento de una guía turística que fue mostrándoles algunos lugares históricos de la ciudad, como el puerto de Buenos Aires, el barrio de Retiro y hasta se pasó por la cancha de River, donde los chicos manifestaron la rivalidad de su club.  Diego, Musicoterapeuta de la entidad, expresó: “Vimos el museo de la pasión boquense, con mucha libertad, y ahí apareció la particularidad de cada uno de ellos, principalmente el sentido del humor. La risa muy bien ubicada. Apareció esa pasión boquense de los dos cuando abrieron las puertas de la popular y entramos al estadio. Destaco el sentido del humor” Po su parte Claudio, uno de los Psicólogos del equipo agregó que la salida fue muy positiva, a partir de la misma se planteó abrir un espacio de actividad aeróbica para que empiecen a manejar su cuerpo de otras formas y los ayude a mejorar su estado físico.  Ambos coinciden sobre la Importancia de generar espacios fuera de la institución por la dinámica, buscando sorprenderlos a ellos, que ellos sorprendan a sus terapeutas y poder trabajar sobre esto.</p> "
Post.create!(title: 'Visita a la cancha de Boca', content: _boca_content)

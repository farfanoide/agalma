# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Branch.create!(name: 'alta sucursal', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, aliquam, magni reiciendis quas voluptatum soluta harum quo dignissimos aut. Veritatis, assumenda distinctio modi dignissimos unde rem enim voluptas consequatur aliquam!')
Branch.create!(name: 'tabajo social', description: 'le faltan cosas donia, nosotro se la conseguimo')
Branch.create!(name: 'mecanica', description: 'le arreglamo el auto donia')

_pass = "12345678"
User.create!(name: 'anacleta', email: 'anacleta@esta.com', password: _pass)
User.create!(name: 'marcela', email: 'marcela@esta.com', password: _pass)
User.create!(name: 'veronica', email: 'veronica@esta.com', password: _pass)
User.create!(name: 'antonio', email: 'antonio@esta.com', password: _pass)
User.create!(name: 'administrador', email: 'admin@agalma.com', password: _pass)

Role.create!(name: 'gil', description: 'es un verdadero gil')
Role.create!(name: 'moderador', description: 'es menos groso')
Role.create!(name: 'admin', description: 'es un groso')

Rolification.create!(user: User.find(1), branch: Branch.find(1), role: Role.find(2))
Rolification.create!(user: User.find(3), branch: Branch.find(2), role: Role.find(3))
Rolification.create!(user: User.find(2), branch: Branch.find(3), role: Role.find(2))
Rolification.create!(user: User.find(3), branch: Branch.find(1), role: Role.find(3))
Rolification.create!(user: User.find(2), branch: Branch.find(1), role: Role.find(1))

_quienes_body = "<p>Los Centros en Salud Mental Agalma están al servicio de la sociedad. Prestan  una amplia cobertura asistencial y terapéutica que permite dar respuesta a las diversas problemáticas propias de la niñez, la infancia y la adolescencia, con un enfoque especializado y un criterio integral, en las áreas de psicología, musicoterapia, psicopedagogía, terapia ocupacional, psicomotricidad, nutrición, kinesiología y asistencia social,  promoviendo la excelencia en la calidad de los tratamientos, la optimización de los recursos y sustentando una particular práctica transdisciplinaria, que incluye la orientación y apoyo a las familias. También cuenta con el área de formación profesional dedicada a la enseñanza, trasmisión y capacitación de profesionales de la salud, sobre distintas temáticas de incidencia eminentemente clínica, relacionadas con los campos disciplinarios que abarca nuestro Equipo.</p>"
Page.create!(title: "quienes somos", body: _quienes_body)

_centros_terapeuticos_body = "<p>Nuestro centro trabaja con profesionales de diferentes disciplinas de la salud mental y&nbsp; médicas. Bajo un particular enfoque transdisciplinario cada profesional trabaja con las herramientas propias de su disciplina, pero comparte con el resto del equipo la misma lógica y direccionalidad de tratamiento. Desde cada especificidad disciplinaria, apostamos en todos los casos a la mayor autonomía y al menor grado de padecimiento posibles de cada paciente.</p><p>Se brindan tratamientos personalizados y grupales en todos los casos.</p><h2>Orientación y Apoyo Familiar:</h2><p>Se realizan entrevistas familiares periódicas, según los requerimientos del caso, con una frecuencia quincenal. Se brinda a los padres y familiares de los pacientes contención y apoyo, al mismo tiempo que se complementa la actividad asistencial, trabajando sobre aquellas cuestiones familiares que están implicadas en la estrategia y la dirección del tratamiento del paciente.</p><h3>Nuestros objetivos&nbsp;</h3><p>Generar en el paciente la emergencia de una posición subjetiva, opuesta a la de la alienación y mecanización del comportamiento y en dirección a lograr la mayor autonomía personal posible.</p><p>Fomentar el consentimiento del paciente hacia la producción y el establecimiento de un lazo social que le permita la habilitación e inserción en su medio habitual desde una posición nueva singularmente creada.</p><p>Ofrecer al sujeto un marco institucional donde pueda desplegar y alojar un trabajo bio-psico-social sobre aquello que lo hace padecer.</p><p>Apoyar y orientar al grupo familiar del paciente.</p><p>En función de su singularidad, viabilizar un accionar saludable del paciente&nbsp; en su vida cotidiana y en el desarrollo de actividades y conocimientos ocupacionales con fines de participación social y laboral, a través de la implementación de actividades tendientes a alcanzar el máximo desarrollo posible de sus potencialidades.&nbsp;</p><p>Plantear estrategias que posibiliten alcanzar el mayor nivel de autovalimiento e integración psicosocial, respetando las características propias de cada paciente.</p>"
Page.create!(title: "centros terapeuticos educativos", body: _centros_terapeuticos_body)

_centro_estimulacion_temprana = "[cargar informacion]"
Page.create!(title: "centro de estimulacion temprana", body: _centro_estimulacion_temprana)






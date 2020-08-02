FactoryBot.define do
  factory :user do
    email    { FFaker::Internet.email }
    password { FFaker::Internet.password }
    question_1 { ['Destinado principalmente a uso comercial, empresarial.', 'Destinado principalmente a uso familiar, domicilar/doméstico.'].sample }
    question_2 { ['Garantia simples.', 'Garantia de 10 anos para o produto e Garantia linear de 25 anos.'].sample }
    question_3 { ['Display simples.', 'Display LCD, resolução full HD, gráfico local e monitoramento remoto de ultima geração.'].sample }
    question_4 { ['10.000,00', '25.000,00', '50.000,00', '100.000,00'].sample }
    question_5 { ['100', '200', '300'].sample }
    question_6 { ['5', '15', '50'].sample }
    question_7 { ['metalico', 'ceramico', 'fibrocimento', 'laje', 'solo', 'trapezoidal'].sample }
  end
end


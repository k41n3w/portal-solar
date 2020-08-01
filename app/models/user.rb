class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.question_1
    ['Destinado principalmente a uso comercial, empresarial.', 'Destinado principalmente a uso familiar, domicilar/doméstico.']
  end

  def self.question_2
    ['Garantia simples.', 'Garantia de 10 anos para o produto e Garantia linear de 25 anos.']
  end

  def self.question_3
    ['Display simples.', 'Display LCD, resolução full HD, gráfico local e monitoramento remoto de ultima geração.']
  end

  def self.question_4
    ['0 a 10.000,00', '10.000,01 a 25.000,00', '25.000,01 a 50.000,00', '50.000,01 a 100.000,00']
  end

  def self.question_5
    ['0 a 100', '101 a 200', '201 a 300']
  end
end

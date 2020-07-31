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
end

# frozen_string_literal: true

class User < ApplicationRecord
  audited
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  QUESTION1 = ['Destinado principalmente a uso comercial, empresarial.', 'Destinado principalmente a uso familiar, domicilar/doméstico.'].freeze
  QUESTION2 = ['Garantia simples.', 'Garantia de 10 anos para o produto e Garantia linear de 25 anos.'].freeze
  QUESTION3 = ['Display simples.', 'Display LCD, resolução full HD, gráfico local e monitoramento remoto de ultima geração.'].freeze
  QUESTION4 = ['10.000,00', '25.000,00', '50.000,00', '100.000,00', '200.000,00'].freeze
  QUESTION5 = %w[100 200 300].freeze
  QUESTION6 = %w[5 15 50].freeze
  QUESTION7 = %w[metalico ceramico fibrocimento laje solo trapezoidal].freeze
end

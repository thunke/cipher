class HomeController < ApplicationController
  def index
    #tmp till it comes from the db
    @ciphers = [{
        :id => 1,
        :cipher_text => "CQN UJF, RW RCB VJSNBCRL NZDJURCH, OXAKRMB CQN ARLQ JB FNUU JB CQN YXXA, CX BUNNY DWMNA KARMPNB, CX KNP RW CQN BCANNCB, JWM CX BCNJU KANJM.",
        :clear_text => "THE LAW, IN ITS MAJESTIC EQUALITY, FORBIDS THE RICH AS WELL AS THE POOR, TO SLEEP UNDER BRIDGES, TO BEG IN THE STREETS, AND TO STEAL BREAD.",
        :author => "Anatole France" 
    }]
  end
end

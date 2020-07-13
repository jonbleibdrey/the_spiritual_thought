class JournalController < ApplicationController

    get '/journal/index' do
        @journals = Journal.all
        erb :'/journal/index'
    end

end
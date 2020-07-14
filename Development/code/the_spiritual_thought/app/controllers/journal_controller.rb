class JournalController < ApplicationController


    #read
    get '/journal/index' do
        @journal = current_user.journals
        erb :'/journal/index'
    end

    # get '/journal/all' do
    #     @journals = Journal.all
    #     erb :'/journal/all'
    # end

    #create
    get '/journal/new' do
        erb :'/journal/new'
    end

    post '/journal/new' do
        @journal = current_user.journals.create(title: params[:title], content: params[:content])
        redirect to :'/journal/index'
    end

    #update
    get '/journal/:id/edit' do
        @journal = Journal.find_by(id: params[:id])
        erb :'/journal/edit'
    end

    patch '/journal/:id' do
        @journal = Journal.find_by(id: params[:id]).update(title: params[:title], content: params[:content])
        redirect to :'/journal/index'
    end

    #delete


end
require 'pry'
class SongsController < ApplicationController

    #Index
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    #New
    get '/songs/new' do
        erb :'/songs/new'
    end

    #Show
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug]) #####
        erb :'/songs/show'
    end

    #Create
    post '/songs' do 
        @song = Song.create(name: params["song"]["name"])
        
        if !params["song"]["artist"]["name"].empty?
            #find or create by
            @song.artist = Artist.find_or_by_create(name: params["song"]["artist"]["name"]) 
            #has to save genre
            @song.genre = params["song"]["genre"]["name"]
        end
        @song.save
        redirect "/songs/#{@song.slug}"
    end

    #Edit
    get '/songs/:id/edit' do
        @song = Song.find_by_slug(params[:slug]) #####
        erb :'/songs/edit'
    end

    #Update
    patch '/songs/:id' do
        @song = Song.find(params[:id])
        @song.update(params[:song])
        redirect "/songs/#{song.id}"
    end
    
end
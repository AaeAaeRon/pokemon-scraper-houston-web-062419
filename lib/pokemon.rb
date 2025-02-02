require "pry"

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db


    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon_found = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        poke = pokemon_found[0]
        Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
        
    end 


end

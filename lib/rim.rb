class Rim
    extend VelocityRimSelector::Findable
    attr_accessor :colors, :url, :desc, :name, :rim_size, :width, :height, :optimal_tire, :interface, :valve, :bsd, :erd, :weight, :spoke, :applications

    @@all = []

    def initialize(name, url = nil, desc = nil, spec_hash = nil)
        @name = name
        @url = url
        @applications = []
        @@all << self
    end

    def add_attributes(hash)
        hash.each {|attrib, value| self.send("#{attrib}=", value)}
    end

    def self.create(name)
        rim = Rim.new(name)
        @@all << rim
        rim
    end

    def add_apps(app)
        self.applications << app unless self.applications.include?(app)
    end
    
    def self.all
        @@all
    end
end
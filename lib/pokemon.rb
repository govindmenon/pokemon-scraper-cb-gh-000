class Pokemon
  attr_accessor :id,:name,:type,:db
  @@id_count=1

  def initialize(args)
    args.each do |key,value|
      self.send("#{key}=",value)
    end
  end

  def self.save(name,type,db)
    db.execute("insert into pokemon values(?,?,?)",@id,name,type)
  end

  def self.find(id,db)
    result = db.execute("select * from pokemon where id=?",id).flatten
    Pokemon.new(id: result[0], name: result[1], type: result[2])
  end
end

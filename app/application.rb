class Application

    @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]  # class array of items 
    def call(env)
      resp = Rack::Response.new  # creating the response
      req = Rack::Request.new(env)  # creating the request
  
      if req.path.match(/items/)  # checing for the path to the itmes
        item_name = req.path.split("/items/").last  
        if item =@@items.find{|i| i.name == item_name}
          resp.write item.price
        else 
          resp.status = 400
          resp.write "Item not found"
        end
      else
        resp.status=404
        resp.write "Route not found"
      end
      resp.finish
    end
  
  end
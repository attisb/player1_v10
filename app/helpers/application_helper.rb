module ApplicationHelper

  def get_beer_name(id)
    beer = BeerSize.where(id: id).first
    if beer.name.nil?
      Unknown
    else
      beer.name
    end
  end  

  def title
    return @title if defined?(@title)
    "Beers. Games. Music."
  end

  def form_errors_for(object=nil)
    render('layouts/form_errors', object: object) unless object.blank?
  end
  
  def link_to_add_fields(name, f, association)
  new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end

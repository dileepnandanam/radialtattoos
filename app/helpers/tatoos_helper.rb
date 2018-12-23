module TatoosHelper
  def next_item(all, current, direction)
    all[(all.index(current) + direction) % all.length]
  end
end

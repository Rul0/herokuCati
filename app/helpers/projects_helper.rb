module ProjectsHelper
  def estado(n)
    case n
    when 0
      "No hubo conexión"
    when 1
      "Completado"
    when 2
      "No volver a llamar"
    when 3
      "Comentario"
    else
      "Algo extraño ocurrio"
    end
  end
end

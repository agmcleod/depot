class CreateSpanishProducts < ActiveRecord::Migration
  def self.up
    Product.create!(:title => "Depurar es!", :price => 34.95, :image_url => '/images/debug.jpg', :locale => 'es',
      :description => "<p>Los programadores profesionales desarrollar una habilidad infalible de la reducci&oacute;n a cero de la causa ra&iacute;z de un error. Se puede hacer eso porque he escrito un mont&oacute;n de c&oacute;digo err&oacute;neo y luego adquirido experiencia arreglarlo. Este libro recoge toda esta experiencia - usarlo, y encontrar&aacute;s a escribir menos errores, y los que escriben se vuelven m&aacute;s f&aacute;ciles de cazar.</p>")
    Product.create!(:title => "Programaci&oacute;n Ruby 1.9", :price => 49.50, :image_url => '/images/ruby.jpg', :locale => 'es',
      :description => "<p>Ruby es el lenguaje de m&aacute;s r&aacute;pido crecimiento y m&aacute;s emocionantes din&aacute;micas que hay. Si necesitas ver los programas de trabajo entregado r&aacute;pida, debe agregar Ruby a su caja de herramientas.</p>")
    Product.create!(:title => "Dise&ntilde;o Web para desarrolladores", :price => 42.95, :image_url => '/images/wd4d.jpg', :locale => 'es',
      :description => '<p>Dise&ntilde;o Web para desarrolladores le mostrar&aacute; c&oacute;mo hacer que su aplicaci&oacute;n basada en web mira de dise&ntilde;o profesional. Vamos a ayudarle a aprender c&oacute;mo elegir los colores y fuentes, evitar errores costosos y la interfaz de accesibilidad - la aplicaci&oacute;n realmente cobran vida. Tambi&eacute;n vamos a caminar a trav&eacute;s de algunas t&eacute;cnicas comunes de Photoshop y CSS y el trabajo a trav&eacute;s de un redise&ntilde;o del sitio web, teniendo un nuevo dise&ntilde;o desde el concepto hasta el final de su implementaci&oacute;n.</p>')
  end

  def self.down
    Product.where(:locale => 'es').each { |p| p.destroy }
  end
end

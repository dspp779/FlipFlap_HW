require 'csv'
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = CSV.parse(tsv, col_sep: "\t", headers: true).map(&:to_h)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    CSV.generate(col_sep: "\t") do |tsv|
      tsv << data.first.keys
      data.to_a.each { |item| tsv << item.values }
    end
  end
end

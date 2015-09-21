Fabricator(:sample, from: Sample, aliases: [:valid_sample]) do
  name 'Sample'
end

Fabricator(:sample2, from: Sample) do
  name 'Sample2'
end
# Function to check whether the domain name was entered in CMD
def get_command_line_argument
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <Domain>"
    exit
  end
  ARGV.first
end

# To get the domain name from CMD
domain = get_command_line_argument

# Read from a file, returns a array of strings
dns_raw = File.readlines('zone')


# My Code
# define functions parse_dns and resolve
def parse_dns(nodeList)
  domain = Hash.new{|hsh,key| hsh[key] = []}
  address = Hash.new{|hsh,key| hsh[key] = []}
  cname = Hash.new{|hsh,key| hsh[key] = []}

  nodeArr = []
  nodeList.each do |node|
    if node == ''|| node.empty? || node == "\n"
      next
    end
    nodeArr.push(node.strip.split(','))
  end

    nodeArr.each do |(type,domain,source)|
      if type == "CNAME"
        cname[source.strip.to_sym].push(domain.strip)
      elsif type == "A"
        address[domain.strip.to_sym].push(source.strip)
      end
    end
  domain[:CNAME].push(cname)
  domain[:ADDRESS].push(address)
  #p cname
  #puts "\n"
  #p address
  return domain
end


def resolve(records, lookup_chain, domain)

  domain = domain.to_s
  for keyHash in records[:CNAME]

    if keyHash.has_key? domain.to_sym
      # p keyHash[domain.to_sym][0]
      lookup_chain.push(keyHash[domain.to_sym][0])
    else
      break
    end
    resolve(records, lookup_chain, keyHash[domain.to_sym][0])
  end

  for keyHash in records[:ADDRESS]
    if keyHash.has_key? domain.to_sym
      lookup_chain.push(keyHash[domain.to_s])
      return lookup_chain
      break
    end
  end
 p lookup_chain
end



dns_records  = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
#puts lookup_chain.join(" => ")

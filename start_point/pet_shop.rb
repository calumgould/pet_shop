def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, pet_breed)
  pet_breed_array = []
  for pet in pet_shop[:pets]
    if pet[:breed] == pet_breed
      pet_breed_array.push(pet[:breed])
    end
  end
  return pet_breed_array
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet_name == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
    for pet in pet_shop[:pets]
      if pet_name == pet[:name]
        pet_shop[:pets].delete(pet)
      end
    end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push({
    name: "Pickle",
    pet_type: :cat,
    breed: "Maine Coon",
    price: 2000
  })
  return pet_shop[:pets].length()
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] == new_pet[:price]
    return true
  elsif customer[:cash] > new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  # if find_pet_by_name(pet_shop, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
    remove_customer_cash(customer, pet[:price])
    remove_pet_by_name(pet_shop, pet)
    return customer_pet_count(customer)
    return pets_sold(pet_shop)
    return total_cash(pet_shop)
    return customer_cash(customer)
    return stock_count(pet_shop)
  # end
end

# def sell_pet_to_customer(pet_shop, pet, customer)
#   if find_pet_by_name(pet_shop, pet)
#     add_pet_to_customer(customer, pet)
#     increase_pets_sold(pet_shop, 1)
#     add_or_remove_cash(pet_shop, 900)
#     remove_customer_cash(customer, 900)
#     remove_pet_by_name(pet_shop, pet)
#     return customer_pet_count(customer)
#     return pets_sold(pet_shop)
#     return total_cash(pet_shop)
#     return customer_cash(customer)
#     return stock_count(pet_shop)
#   end
# end

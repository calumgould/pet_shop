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
  if find_pet_by_name(pet_shop, pet_name)
    return pet_shop[:pets].clear()
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

def customer_cash(customers)
  return customers[:cash]
end

def remove_customer_cash(customers, amount)
  return customers[:cash] -= amount
end

def customer_pet_count(customers)
  return customers[:pets].length()
end

def add_pet_to_customer(customers, new_pet)
  customers[:pets].push(new_pet)
end

def customer_can_afford_pet(customers, new_pet)
  if customers[:cash] == new_pet[:price]
    return true
  elsif customers[:cash] > new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet_name, customers)
  if find_pet_by_name(pet_shop, pet_name)
    customers[:pets].push(pet_shop[:pets][3])
    return customer_pet_count(customers)
    pet_shop[:admin][:pets_sold] += 1
    return pets_sold(pet_shop)
    customers[:cash] -= pet_shop[:pets][:price]
    return customer_cash(customers)
    pet_shop[:admin][:total_cash] += pet_shop[:pets][:price]
    return total_cash(pet_shop)
  end
end

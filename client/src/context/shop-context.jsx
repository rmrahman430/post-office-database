import React, { createContext, useState, useEffect } from "react";
import { PRODUCTS } from "../products";
import axios from 'axios';

export const ShopContext = createContext(null);

const getDefaultCart = async () => {
  const id = localStorage.getItem('id');
  const cartId = localStorage.getItem('cartId');

  if (!id || !cartId) {
    return {}; // Return an empty cart if credentials are missing
  }

  try {
    const response = await axios.get('/api/cart_items'); // Replace with your actual API endpoint
    const cartItems = response.data;

    // Filter cart items based on user ID (if necessary)
    const filteredCartItems = cartItems.filter(item => item.CartID === cartId && item.PackageID === null);

    // Create a cart object with quantities for each product
    let cart = {};
    PRODUCTS.forEach(product => {
      cart[product.id] = 0;
      const matchingItem = filteredCartItems.find(cartItem => cartItem.StoreItemID === product.id);
      if (matchingItem) {
        cart[product.id] = matchingItem.Quantity;
      } else {
      }
    });

    return cart;
  } catch (error) {
    return {}; // Return an empty cart on error
  }
};

export const ShopContextProvider = (props) => {
  const [cartItems, setCartItems] = useState({}); // Set initial state to an empty object

  useEffect(() => {
    // Define an async function within the useEffect
    const fetchCart = async () => {
      const defaultCart = await getDefaultCart(); // Await the async call
      setCartItems(defaultCart); // Set the state with the resolved value
    };

    fetchCart(); // Call the async function
  }, []);
  

  useEffect(() => {
    console.log("Cart Items Updated:", cartItems);
  }, [cartItems]);

  const getTotalCartAmount = () => {
    let totalAmount = 0;
    if (Object.keys(cartItems).length > 0) {
      totalAmount = Object.keys(cartItems).reduce((sum, key) => {
        const product = PRODUCTS.find(p => p.id.toString() === key);
        return sum + (product ? cartItems[key] * product.price : 0);
      }, 0);
    }
    return totalAmount;
  };
  

  

  const addToCart = async (itemId) => {
    const cartId = localStorage.getItem('cartId');
  
    try {
      // Prepare request data (replace with your actual API endpoint and data structure)
      const requestData = {
        itemId,
        cartId,
        // Add other necessary data for adding to cart (e.g., quantity)
      };
  
      const response = await axios.post('/api/cart_items/add', requestData); // Replace with your API endpoint
      console.log("API response:", response.data);
  
      // Update cart state based on successful response (if applicable)
      if (response.data.success) { // Assuming response has a success property
        setCartItems((prev) => {
          const updatedCart = { ...prev, [itemId]: (prev[itemId] || 0) + 1 };
          console.log("Item Added to Cart:", itemId, "Updated Cart:", updatedCart);
          return updatedCart;
        });
      } else {
        console.error("Error adding item to cart:", response.data.error); // Handle errors
      }
    } catch (error) {
      console.error("Error adding item to cart:", error); // Handle network or other errors
    }
  };
  
  const removeFromCart = async (itemId, amount) => {
    const cartId = localStorage.getItem('cartId');
  
    try {
      // Prepare request data for removal (replace with your actual API endpoint and data structure)
      const requestData = {
        itemId,
        cartId,
        amount
      };
  
      const response = await axios.post('/api/cart_items/remove', requestData); // Replace with your API endpoint for removal
      console.log("API response:", response.data);
  
      // Update cart state based on successful response (if applicable)
      if (response.data.success) { // Assuming response has a success property
        setCartItems((prev) => {
          const updatedCart = { ...prev, [itemId]: Math.max((prev[itemId] || 0) - amount, 0) };
          console.log("Item Removed from Cart:", itemId, "Updated Cart:", updatedCart);
          return updatedCart;
        });
      } else {
        console.error("Error removing item from cart:", response.data.error); // Handle errors
      }
    } catch (error) {
      console.error("Error removing item from cart:", error); // Handle network or other errors
    }
  };
  
  const updateCartItemCount = async (newAmount, itemId) => {
    const cartId = localStorage.getItem('cartId');
  
    try {
      // Prepare request data for update (replace with your actual API endpoint and data structure)
      const requestData = {
        itemId,
        cartId,
        newQuantity: newAmount, // Assuming you have a newQuantity property in your API request
      };
  
      const response = await axios.post('/api/cart_items/update', requestData); // Replace with your API endpoint for update
      console.log("API response:", response.data);
  
      // Update cart state based on successful response
      if (response.data.success) { // Assuming response has a success property
        setCartItems((prev) => {
          const updatedCart = { ...prev, [itemId]: Math.max(newAmount, 0) }; // Consider using response.data.quantity if needed
          console.log("Cart Item Count Updated:", itemId, "New Amount:", newAmount, "Updated Cart:", updatedCart);
          return updatedCart;
        });
      } else {
        console.error("Error updating cart item:", response.data.error); // Handle errors
        // You might consider reverting the state change or displaying an error message
      }
    } catch (error) {
      console.error("Error updating cart item:", error); // Handle network or other errors
      // Handle the error gracefully, potentially retrying or informing the user
    }
  };

  async function checkout() {
    try {
      const cartId = localStorage.getItem('cartId');
  
      // Construct API endpoint URL
      const apiEndpoint = `/api/cart_items_deletion/${cartId}`;
  
      // Make the API request to delete cart items
      const response = await axios.delete(apiEndpoint);
  
      if (response.data.success) {
        // Clear cart items locally if API deletion is successful
        setCartItems(getDefaultCart());
        console.log("Cart Items Cleared - Checkout Complete");
      } else {
        // Handle error from API response
        console.error("Error clearing cart:", response.data.error);
        // Consider displaying a user-friendly error message or retrying the operation
      }
    } catch (error) {
      // Handle general errors during the request or response handling
      console.error("Error clearing cart:", error);
      // Consider implementing more specific error handling or retries
    }
  }

  const contextValue = {
    cartItems,
    addToCart,
    updateCartItemCount,
    removeFromCart,
    getTotalCartAmount,
    checkout,
  };

  return (
    <ShopContext.Provider value={contextValue}>
      {props.children}
    </ShopContext.Provider>
  );
};

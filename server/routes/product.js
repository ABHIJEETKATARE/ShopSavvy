const express=require("express")
const productRouter=express.Router()
const auth = require('../middlewares/auth');
const {Product} = require('../models/product');
//const product = require("../models/product");
//const ratingSchema = require("../models/rating")

productRouter.get("/api/products",auth,async(req,res)=>{
    try{
        const products=await Product.find({category:req.query.category});
        res.json(products);
    }
    catch(e)
    {
        res.status(500).json({error:e.message});
    }
});

productRouter.get("/api/products/search/:name",auth,async(req,res)=>{
try{
    const products =await Product.find({name:{$regex: req.params.name,$options:"i"}});
    res.json(products);
}
catch(e)
{
    res.status(500).json({error:e.message});
}
})
productRouter.post("/api/rate-product",auth,async(req,res)=>{
   
     
    try{ const {id,rating}=req.body;
        let product= await Product.findById(id);
        for (let index = 0; index < (product.ratings.length); index++) {
            if(product.ratings[index].userId==req.user)
                {product.ratings.splice(index,1);
                    break;}
            
        }
        const ratingSchema = {
            userId: req.user,
            rating,
          };
      
          product.ratings.push(ratingSchema);
          product = await product.save();
          res.json(product);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
})
module.exports=productRouter;

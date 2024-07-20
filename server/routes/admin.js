const express=require("express")
const admin=require("../middlewares/admin");
const Product = require("../models/product");
const adminRouter=express.Router();

adminRouter.post("/admin/add-product",admin,async(req,res)=>{
    try{const{name,description,quantity,price,category,images}=req.body;
    let product=new Product({name,description,quantity,price,images,category});
    const save=await product.save();
    res.status(200).json(product);
}
    catch(e){
        res.status(500).json({msg:e.message});
    }
})
adminRouter.get("/admin/get-products",admin,async(req,res)=>{
    try{const products=await Product.find({});
    res.json(products);}
    catch(e){
        res.status(500).json({msg:e.message})
    }
})

//delete the product
adminRouter.post('/admin/delete-product',admin,async(req,res)=>{
try{
    const {id}=req.body;
    let product =await Product.findByIdAndDelete(id);
   //product= product.save();
   res.json(product);
}
catch(e){
    res.status(500).json({error:e.message});
}
})
module.exports=adminRouter;
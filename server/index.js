console.log("hello");
const port=process.env.PORT||3000;
const express=require("express");
const mongoose = require("mongoose");
const db="mongodb+srv://ABHIJEET:854286@cluster0.vrb0u6b.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
const authRouter=require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const admin = require("./middlewares/admin");
const app=express();
//middlewares
app.use(express.json());
mongoose.connect(db).then(()=>{console.log("successful")}).catch((e)=>{console.log(e)});
mongoose.load
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
//app.use(admin)
app.listen(port,"0.0.0.0",()=>{console.log(`connected at port ${port}`);});

const jwt=require("jsonwebtoken");
const User = require("../models/user");
const admin=async(req,res,next)=>{
    try{const token=req.header("x-auth-token");
    if(!token)
    {
        res.status(401).json({msg:"no auth token,access denied"});
    }
    const verified=jwt.verify(token,"passwordKey");
    if(!verified)
    {
        res.status(401).json({msg:"token verification failed,authorization denied"});
    }
    const user=await User.findById(verified.id);
    if(user.type=="seller"||user.type=="user")
    {
        res.status(401).json({msg:"You are not an admin"});
    }
    req.user=verified.id;
    req.token=token;
    next();}
    catch(e){
        res.status(500).json({msg:e.message})
    }
}
module.exports=admin;
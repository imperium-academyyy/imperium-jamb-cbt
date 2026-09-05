const express = require("express");

const app = express();

const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/", (req, res) => {
    res.json({
        success: true,
        message: "Imperium Academy JAMB CBT Backend is running!",
        version: "1.0.0"
    });
});

app.get("/api/status", (req, res) => {
    res.json({
        online: true,
        platform: "Imperium Academy JAMB CBT",
        questionBank: "5,000+ questions planned"
    });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
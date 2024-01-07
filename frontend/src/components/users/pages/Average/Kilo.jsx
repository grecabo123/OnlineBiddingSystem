import axios from 'axios';
import React, { useEffect } from 'react'
import { useState } from 'react';
import { Chart } from 'primereact/chart';


function Kilo() {

    var months = [];
    var total = [];

    const [DataKilo, setKilo] = useState([])

    useEffect(() => {
        axios.get(`/api/AverageKilo/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setKilo(res.data.data);
            }
        }).catch((error) => {

        })
    },[]);

    for (let index = 0; index < DataKilo.length; index++) {
        const month = DataKilo[index].month;
        const total_ = DataKilo[index].total;
        
        months.push(month)
        total.push(total_)
    }

    
    const data = {
        
        labels: months,
        datasets: [
            {
                label: 'Average Monthly Kilo',
                data: total,
                borderWidth: 1
            }
        ]
    };
    const options = {
        indexAxis: 'y',
        maintainAspectRatio: false,
        aspectRatio: 0.8,
        scales: {
            x: {
                grid: {
                    display: false
                }
            },
            y: {
                beginAtZero: true,
                grid: {
                    display: false
                }
            }
        }
    };



    return (
        <div>
            <Chart type="bar" style={{ height: "320px" }} width='100%'   data={data} options={options} />
        </div>
    )
}

export default Kilo
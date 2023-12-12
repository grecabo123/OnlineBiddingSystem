import axios from 'axios'
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';
import { Card } from 'primereact/card';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Tag } from 'primereact/tag';

function Accounts() {

    const [RegisteredData, setRegister] = useState([]);
    const [loading, setloading] = useState(true);

    useEffect(() => {
        axios.get(`/api/registered`).then(res => {
            if (res.data.status === 200) {
                setRegister(res.data.accounts);
            }
            setloading(false)
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');

            }
        })
    }, []);

    console.log(RegisteredData);

    const AccountRole = (RegisteredData) => {
        return (
            <>
                {
                    RegisteredData.role === 1 ? <Tag className='p-tag' value="Admin" severity={'info'} /> : <Tag value="User" className='p-tag' severity={'warning'} />
                }
            </>
        )
    }
    const AccountStatus = (RegisteredData) => {
        return (
            <>
                {
                    RegisteredData.status === 1 ? <Tag className='p-tag' value="Active" severity={'success'} /> : <Tag value="In Active" className='p-tag' severity={'danger'} />
                }
            </>
        )
    }


    return (
        <div className=' p-3'>
            <Card title="List of Users">
                <DataTable value={RegisteredData} paginator rows={5} loading={loading} paginatorLeft>
                    <Column field='name_user' header="Name of User"></Column>
                    <Column field='username' header="Username"></Column>
                    <Column field='email' header="Email"></Column>
                    <Column field='role' body={AccountRole} header="Account Role"></Column>
                    <Column field='status' body={AccountStatus} header="Account Status"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Accounts